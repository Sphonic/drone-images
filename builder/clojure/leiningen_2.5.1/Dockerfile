FROM sphonic/base:trusty
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ADD https://raw.githubusercontent.com/technomancy/leiningen/2.5.1/bin/lein /usr/local/bin/lein

RUN \
  chmod +x /usr/local/bin/lein
