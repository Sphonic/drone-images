FROM sphonic/base-java:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

ADD http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb /tmp/

RUN \
  dpkg -i /tmp/sbt.deb                                                        && \
  apt-get clean                                                               && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD http://www.scala-lang.org/files/archive/scala-2.11.5.deb /tmp/

RUN \
  apt-get update -qq                                                          && \
  apt-get install libjansi-java libjansi-native-java libhawtjni-runtime-java  && \
  dpkg -i /tmp/scala-2.11.5.deb                                               && \
  apt-get clean                                                               && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
