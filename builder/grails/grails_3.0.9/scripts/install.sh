#!/bin/bash

set -x
set -e

# install sdkman
curl -s get.gvm.io | bash

# configure sdkman to run non-interactive
mkdir -p /root/.sdkman/etc
cat << EOF > /root/.sdkman/etc/config
sdkman_auto_answer=true
sdkman_auto_selfupdate=false
EOF

# activate default groovy and grails versions
bash /etc/drone.d/sdkman.sh

# exit successfully
exit 0
