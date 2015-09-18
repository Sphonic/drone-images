#!/bin/bash -e

# clone goenv
# use the Sphonic/goenv fork because of changes for binary download URLs
sudo git clone git://github.com/Sphonic/goenv.git ~/.goenv

# alter path and install default golang via /etc/drone.d/goenv.sh
sudo bash /etc/drone.d/goenv.sh

