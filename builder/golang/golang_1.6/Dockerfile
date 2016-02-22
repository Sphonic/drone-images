FROM sphonic/base-core:20160207

MAINTAINER Daniel Malon <operations@sphonic.com>

ENV GOENV_VERSION 1.6

ADD golang_gopath.sh /etc/drone.d/

RUN /bin/bash /etc/drone.d/goenv.sh
