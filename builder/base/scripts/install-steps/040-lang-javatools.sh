#!/bin/bash -e

# install java buildtools
sudo apt-get install \
  ant \
  ant-contrib \
  ivy \
  maven

# install gradle
GRADLE_VERSION=${GRADLE_VERSION:="2.2.1"}

pushd /tmp

# download and extract binary package
curl -Lo gradle.zip https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
unzip gradle.zip

# move to /usr/local and symlink executable
sudo mv gradle-${GRADLE_VERSION} /usr/local/gradle-${GRADLE_VERSION}
sudo chown -R root:root /usr/local/gradle-${GRADLE_VERSION}
sudo ln -sf /usr/local/gradle-${GRADLE_VERSION}/bin/gradle /usr/local/bin/gradle

# cleanup
rm -rf gradle*

popd
