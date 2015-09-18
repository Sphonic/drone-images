FROM sphonic/base-java:20150918

MAINTAINER Daniel Malon <operations@sphonic.com>

RUN \
  curl -Lo /tmp/scala.deb http://www.scala-lang.org/files/archive/scala-2.11.6.deb && \
  curl -Lo /tmp/sbt.deb http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.9/sbt.deb && \
  apt-get update -qq                                                          && \
  apt-get install libjansi-java libjansi-native-java libhawtjni-runtime-java  && \
  dpkg -i /tmp/scala.deb                                                      && \
  dpkg -i /tmp/sbt.deb                                                        && \
  apt-get clean                                                               && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
