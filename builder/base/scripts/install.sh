#!/bin/bash

set -x
set -e

# reconfigure debconf to be noninteactive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# update package repository cache
sudo apt-get -qq update

# add essential packages
sudo apt-get -y install \
  git git-core\
  subversion \
  mercurial \
  bzr \
  fossil \
  xvfb \
  socat \
  unzip xzdec

# loop over available install steps and execute them one-by-one
# naming defines order of execution
for step in $(dirname $(readlink -f $0))/install-steps/*.sh; do
  if [[ -x $step ]]; then
    source $step
  fi
done

# exit successfully
exit 0
