#!/bin/bash -e

# install the compiler
sudo apt-get -y install \
  gcc \
  clang

# install suggested/recommended packages
sudo apt-get -y install \
  automake \
  autoconf \
  autogen \
  libtool \
  make \
  cmake \
  gdb \
  bison \
  flex

# install additional build tools
sudo apt-get -y install \
  build-essential \
  scons
