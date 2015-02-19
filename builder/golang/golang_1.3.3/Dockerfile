FROM sphonic/base-core:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

ENV GOENV_VERSION 1.3.3

ADD golang_gopath.sh /etc/drone.d/

RUN /bin/bash /etc/drone.d/goenv.sh
