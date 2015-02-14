# set default env vars
export GOENV_VERSION=${GOENV_VERSION:="1.4.1"}
export NODE_ENV=${NODE_ENV:="test"}

# extend path
export PATH=$PATH:~/.goenv/bin

# initialize goenv
if which goenv > /dev/null; then
  eval "$(goenv init -)"

  # install requested version if necessary
  if [[ -z "$(goenv versions | grep ${GOENV_VERSION})" ]]; then
    echo "Installing nodejs version: ${GOENV_VERSION}"

    goenv install ${GOENV_VERSION}

    goenv global ${GOENV_VERSION}
    goenv rehash
  else
    goenv global ${GOENV_VERSION}
    goenv rehash
  fi
fi
