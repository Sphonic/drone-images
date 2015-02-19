#!/bin/bash -e

CHROMEDRIVER_VERSION=${CHROMEDRIVER_VERSION:="2.14"}

pushd /tmp

# download and extract binary package
curl -Lo chromedriver.zip http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip
unzip chromedriver.zip

# install binary
sudo install -t /usr/local/bin chromedriver

# cleanup
rm -rf chromedriver*

popd
