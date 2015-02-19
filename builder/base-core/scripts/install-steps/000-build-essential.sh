#!/bin/bash -e

# install the compiler
# install suggested/recommended packages
# install additional build tools
sudo apt-get -yqq install \
  gcc \
  clang \
  automake \
  autoconf \
  autogen \
  libtool \
  make \
  cmake \
  gdb \
  bison \
  flex \
  build-essential \
  scons
