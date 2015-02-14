FROM sphonic/base:trusty
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ENV GOENV_VERSION 1.3.3

ADD golang_gopath.sh /etc/drone.d/

RUN /bin/bash /etc/drone.d/goenv.sh
