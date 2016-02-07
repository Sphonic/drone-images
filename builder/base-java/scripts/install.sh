#!/bin/bash

set -x
set -e

# accept licenses for oracle-java
cat << EOF | sudo /usr/bin/debconf-set-selections
oracle-java7-installer shared/accepted-oracle-license-v1-1 select true
oracle-java8-installer shared/accepted-oracle-license-v1-1 select true
EOF

# add oracle-java installer ppa repository
sudo add-apt-repository -y ppa:webupd8team/java

# update package repository cache
sudo apt-get -yqq update

# install oracle-jdk-7
# install oracle-jdk-8
# install openjdk-7
sudo apt-get install -yqq \
  oracle-java7-installer \
  oracle-java8-installer \
  openjdk-7-jdk \
  openjdk-8-jdk

# set openjdk-7 as default jdk
sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

# install java buildtools
sudo apt-get install -yqq \
  ant \
  ant-contrib \
  ivy \
  maven

# install gradle
GRADLE_VERSION=${GRADLE_VERSION:="2.10"}

pushd /tmp

# download and extract binary package
curl -Lo gradle.zip https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip
unzip gradle.zip

# move to /usr/local and symlink executable
sudo mv gradle-${GRADLE_VERSION} /usr/local/gradle-${GRADLE_VERSION}
sudo chown -R root:root /usr/local/gradle-${GRADLE_VERSION}
sudo ln -sf /usr/local/gradle-${GRADLE_VERSION}/bin/gradle /usr/local/bin/gradle

popd

# cleanup
sudo apt-get clean && sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/oracle-jdk*-installer

# exit successfully
exit 0
