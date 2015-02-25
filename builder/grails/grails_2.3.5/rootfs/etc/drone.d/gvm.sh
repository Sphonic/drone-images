# set default env vars
export GROOVY_VERSION=${GROOVY_VERSION:=""}
export GRAILS_VERSION=${GRAILS_VERSION:=""}

# load gvmtool if installed
if [[ -f /root/.gvm/bin/gvm-init.sh ]]; then
  source /root/.gvm/bin/gvm-init.sh

  # install requested groovy version if necessary
  if [[ ! -z ${GROOVY_VERSION} ]]; then
    gvm use groovy ${GROOVY_VERSION}
  fi

  # install requested grails version if necessary
  if [[ ! -z ${GRAILS_VERSION} ]]; then
    gvm use grails ${GRAILS_VERSION}
  fi

  # flush archives
  gvm flush archives 1> /dev/null
fi
