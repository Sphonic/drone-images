FROM sphonic/base-java:20160207

MAINTAINER Daniel Malon <operations@sphonic.com>

RUN \
  curl -Lo /tmp/scala.deb http://www.scala-lang.org/files/archive/scala-2.11.8.deb && \
  curl -Lo /tmp/sbt.deb https://dl.bintray.com/sbt/debian/sbt-0.13.11.deb     && \
  apt-get update -qq                                                          && \
  apt-get install libjansi-java libjansi-native-java libhawtjni-runtime-java  && \
  dpkg -i /tmp/scala.deb                                                      && \
  dpkg -i /tmp/sbt.deb                                                        && \
  apt-get clean                                                               && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
