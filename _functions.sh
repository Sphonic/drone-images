# these function assume that the docker user is exported as an ENV variable
DOCKER_USER=${DOCKER_USER:="sphonic"}

LOG_DIR=${LOG_DIR:="$(dirname $(readlink -f $0))/logs"}

# function to create Docker images and print out
# the result. If image creation fails, we'll print
# out the stderr.
build() {
  name=$1;
  path=$2;
  dockerfile=$3;

  # resolve to default value if not set
  dockerfile=${dockerfile:="Dockerfile"};

  # log docker output to this file
  logfile="${LOG_DIR}/${name//:/_}.log"

  if [[ ! -d $path ]]; then
    echo -e "\e[31m ✗ MISSING   \e[0m ${DOCKER_USER}/${name}";
    return
  fi

  if [[ ! -r "${path}/${dockerfile}" ]]; then
    echo -e "\e[31m ✗ MISSING   \e[0m ${DOCKER_USER}/${name}/${dockerfile}";
    return
  fi

  # split out repository and tag out of the image name
  repository="${DOCKER_USER}/${name%:*}"
  tag=${name##*:}

  # skip the build if the image already exists with the requested tag
  docker images $repository | grep ${tag} 2>&1 > /dev/null
  if [[ $? -eq 0 ]]; then
    echo -e "\e[32m ✓ EXISTS    \e[0m ${DOCKER_USER}/${name}";
    return
  fi

  # build docker image for the given path
  docker build --rm -f ${path}/${dockerfile} -t ${DOCKER_USER}/${name} $path 2>&1 > $logfile
  ret=$?

  if [[ $ret -gt 0 ]]; then
    # display the last 50 lines for the failed docker build
    tail -n50 $logfile
    echo -e "\e[31m ✗ FAILURE   \e[0m ${DOCKER_USER}/${name}";
  else
    # docker doesn't seem to exit with an error code
    # if the Dockerfile fails to create an image.
    # so let's proactively check to see if it exists.
    docker images $repository | grep ${tag} 2>&1 > /dev/null
    if [[ $? -gt 0 ]]; then
      tail -n50 $logfile
      echo -e "\e[31m ✗ FAILURE   \e[0m ${DOCKER_USER}/${name}";
    else
      echo -e "\e[32m ✓ CREATED   \e[0m ${DOCKER_USER}/${name}";
    fi
  fi
}

# function to remove Docker images and print out
# the result. If image removal fails, we'll print
# out the stderr.
remove() {
  name=$1;

  result=$(docker rmi ${DOCKER_USER}/${name} 2>&1);
  if [[ $? -gt 0 ]]; then
    # check if a image with the supplied name is registered
    docker images | grep ${DOCKER_USER}/${name} 2>&1
    if [[ $? -gt 0 ]]; then
      echo -e "\e[32m ✓ REMOVED   \e[0m ${DOCKER_USER}/${name}";
    else
      echo -e "\e[31m ✗ FAILURE   \e[0m ${DOCKER_USER}/${name}";
    fi
  else
    echo -e "\e[32m ✓ REMOVED   \e[0m ${DOCKER_USER}/${name}";
  fi
}

# function to publish Docker images to the Hub
publish() {
  name=$1;

  # log docker output to this file
  logfile="${LOG_DIR}/${name//:/_}_publish.log"

  docker push ${DOCKER_USER}/${name} 2>&1 > $logfile
  if [[ $? -gt 0 ]]; then
    echo -e "\e[31m ✗ FAILURE   \e[0m ${DOCKER_USER}/${name}";
  else
    echo -e "\e[32m ✓ PUBLISH   \e[0m ${DOCKER_USER}/${name}";
  fi
}

skip() {
  name=$1;
  path=$2;

  echo -e "\e[33m – SKIPPED   \e[0m ${DOCKER_USER}/${name}";
}

deprecated() {
  name=$1;
  path=$2;

  echo -e "\e[34m – DEPRECATED\e[0m ${DOCKER_USER}/${name}";
}
