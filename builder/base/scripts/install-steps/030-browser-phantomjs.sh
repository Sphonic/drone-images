#!/bin/bash -e

PHANTOMJS_VERSION=${PHANTOMJS_VERSION:="1.9.2"}

pushd /tmp

# download and extract binary package
curl -L https://phantomjs.googlecode.com/files/phantomjs-${PHANTOMJS_VERSION}-linux-x86_64.tar.bz2 | tar -xj

# install binary
sudo install -t /usr/local/bin phantomjs-${PHANTOMJS_VERSION}-linux-x86_64/bin/phantomjs

# cleanup
rm -rf phantomjs-${PHANTOMJS_VERSION}-linux-x86_64*

popd
