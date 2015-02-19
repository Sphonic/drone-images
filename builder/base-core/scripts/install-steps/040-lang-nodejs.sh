#!/bin/bash -e

# clone nodenv
sudo git clone git://github.com/OiNutter/nodenv.git ~/.nodenv
sudo git clone git://github.com/OiNutter/node-build.git ~/.nodenv/plugins/node-build

# alter path and install default nodejs via /etc/drone.d/nodenv.sh
sudo bash /etc/drone.d/nodenv.sh
