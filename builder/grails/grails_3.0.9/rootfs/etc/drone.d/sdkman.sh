# set default env vars
export GROOVY_VERSION=${GROOVY_VERSION:=""}
export GRAILS_VERSION=${GRAILS_VERSION:=""}

# load sdkman if installed
if [[ -f /root/.sdkman/bin/sdkman-init.sh ]]; then
  source /root/.sdkman/bin/sdkman-init.sh

  # install requested groovy version if necessary
  if [[ ! -z ${GROOVY_VERSION} ]]; then
    sdk use groovy ${GROOVY_VERSION}
  fi

  # install requested grails version if necessary
  if [[ ! -z ${GRAILS_VERSION} ]]; then
    sdk use grails ${GRAILS_VERSION}
  fi

  # flush archives
  sdk flush archives 1> /dev/null
fi
