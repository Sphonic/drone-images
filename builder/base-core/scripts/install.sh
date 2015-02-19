#!/bin/bash

set -x
set -e

# reconfigure debconf to be noninteactive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update package repository cache
sudo apt-get -yqq update

# add essential packages
sudo apt-get install -yqq \
  software-properties-common \
  git git-core \
  subversion \
  mercurial \
  bzr \
  fossil \
  xvfb \
  socat \
  unzip xzdec \
  curl wget

# loop over available install steps and execute them one-by-one
# naming defines order of execution
for step in $(dirname $(readlink -f $0))/install-steps/*.sh; do
  if [[ -x $step ]]; then
    source $step
  fi
done

# cleanup
sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# exit successfully
exit 0
