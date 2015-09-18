# set default env vars
export RBENV_VERSION=${RBENV_VERSION:=""}
export RAILS_ENV=${RAILS_ENV:="test"}

# extend path
export PATH=$PATH:~/.rbenv/bin

# initialize rbenv if needed
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"

  # install requested version if necessary
  if [[ ! -z ${RBENV_VERSION} ]]; then
    if [[ -z "$(rbenv versions | grep ${RBENV_VERSION})" ]]; then
      echo "Installing ruby version: ${RBENV_VERSION}"

      CC=gcc CONFIGURE_OPTS=--enable-shared rbenv install ${RBENV_VERSION}

      rbenv global ${RBENV_VERSION}
      rbenv rehash

      # add bundler
      gem install bundler --no-ri --no-rdoc

      rbenv rehash
    else
      rbenv global ${RBENV_VERSION}
      rbenv rehash
    fi
  fi
fi

