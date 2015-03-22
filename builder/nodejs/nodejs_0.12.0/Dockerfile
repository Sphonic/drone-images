FROM sphonic/base-core:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

ENV NODENV_VERSION 0.12.0

RUN \
  git -C .nodenv/plugins/node-build pull && \
  /bin/bash /etc/drone.d/nodenv.sh
