#!/bin/bash

set -x
set -e

# install gvmtool
curl -s get.gvmtool.net | bash

# configure gvmtool to run non-interactive
mkdir -p /root/.gvm/etc
cat << EOF > /root/.gvm/etc/config
gvm_auto_answer=true
gvm_auto_selfupdate=false
EOF

# activate default groovy and grails versions
bash /etc/drone.d/gvm.sh

# exit successfully
exit 0
