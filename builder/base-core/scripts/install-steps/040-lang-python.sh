#!/bin/bash -e

# clone pyenv
sudo git clone git://github.com/yyuu/pyenv.git ~/.pyenv

# alter path and install default python via /etc/drone.d/pyenv.sh
sudo bash /etc/drone.d/pyenv.sh

