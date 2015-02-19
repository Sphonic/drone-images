#!/bin/bash -e

# clone rbenv + ruby-build
sudo git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
sudo git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# alter path and install default ruby via /etc/drone.d/rbenv.sh
sudo bash /etc/drone.d/rbenv.sh
