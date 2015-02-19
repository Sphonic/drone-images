# set default env vars
export GOENV_VERSION=${GOENV_VERSION:=""}

# extend path
export PATH=$PATH:~/.goenv/bin

# initialize goenv
if which goenv > /dev/null; then
  eval "$(goenv init -)"

  # install requested version if necessary
  if [[ ! -z ${GOENV_VERSION} ]]; then
    if [[ -z "$(goenv versions | grep ${GOENV_VERSION})" ]]; then
      echo "Installing nodejs version: ${GOENV_VERSION}"

      goenv install ${GOENV_VERSION}

      goenv global ${GOENV_VERSION} 1>/dev/null
      goenv rehash
    else
      goenv global ${GOENV_VERSION} 1>/dev/null
      goenv rehash
    fi
  fi
fi
