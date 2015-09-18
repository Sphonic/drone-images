#!/bin/bash -e

# install libcurl
# install libffi
# install libfontconfig1
# install libgdbm
# install libmagick
# install libmemcache
# install libmysql
# install libncurses
# install libossp-uuid
# install libpq
# install libqt4
# install libreadline
# install libsqlite3
# install libssl
# install libxml2 + libxslt
# install libyaml
# install libz/zlib
# install libzmq
sudo apt-get -yqq install \
  libcurl3 \
  libcurl3-gnutls \
  libcurl4-openssl-dev \
  libffi-dev \
  libffi6 \
  libfontconfig1-dev \
  libgdbm-dev \
  libgvc6 \
  libmagickwand-dev \
  imagemagick \
  libmemcache-dev \
  libmysqlclient-dev \
  libncurses5 \
  libncurses5-dev \
  libncurses5-dbg \
  libossp-uuid-dev \
  libpq-dev \
  libqt4-dev \
  libreadline6 \
  libreadline6-dev \
  libsqlite3-dev \
  sqlite3 \
  sqlite3-doc \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  libxslt-dev \
  libyaml-0-2 \
  libyaml-dev \
  zlib1g \
  zlib1g-dev \
  libzmq-dev

