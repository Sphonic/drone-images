# set default env vars
export NODENV_VERSION=${NODENV_VERSION:=""}
export NODE_ENV=${NODE_ENV:="test"}

# extend path
export PATH=$PATH:~/.nodenv/bin

# initialize nodenv
if which nodenv > /dev/null; then
  eval "$(nodenv init -)"

  # install requested version if necessary
  if [[ ! -z ${NODENV_VERSION} ]]; then
    if [[ -z "$(nodenv versions | grep ${NODENV_VERSION})" ]]; then
      echo "Installing nodejs version: ${NODENV_VERSION}"

      nodenv install ${NODENV_VERSION}

      nodenv global ${NODENV_VERSION}
      nodenv rehash
    else
      nodenv global ${NODENV_VERSION}
      nodenv rehash
    fi
  fi
fi
