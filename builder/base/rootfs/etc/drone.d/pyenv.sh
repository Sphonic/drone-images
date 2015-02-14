# set default env vars
export PYENV_VERSION=${PYENV_VERSION:="2.7.9"}

# extend path
export PATH=$PATH:~/.pyenv/bin

# initialize pyenv if needed
if which pyenv > /dev/null; then
  eval "$(pyenv init -)"

  # install requested version if necessary
  if [[ -z "$(pyenv versions | grep ${PYENV_VERSION})" ]]; then
    echo "Installing python version: ${PYENV_VERSION}"

    CC=gcc CONFIGURE_OPTS=--enable-shared pyenv install ${PYENV_VERSION}

    pyenv global ${PYENV_VERSION}
    pyenv rehash
  else
    pyenv global ${PYENV_VERSION}
    pyenv rehash
  fi
fi
