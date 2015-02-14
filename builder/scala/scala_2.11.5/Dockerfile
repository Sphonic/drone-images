FROM sphonic/base:trusty
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ADD http://www.scala-lang.org/files/archive/scala-2.11.5.deb /tmp/
ADD http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb /tmp/

RUN \
  apt-get install libjansi-java libjansi-native-java libhawtjni-runtime-java  && \
  dpkg -i /tmp/scala-2.11.5.deb                                               && \
  dpkg -i /tmp/sbt.deb                                                        && \
  rm -f /tmp/scala-2.11.5.deb /tmp/sbt.deb
