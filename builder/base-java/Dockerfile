FROM sphonic/base-core:20160207

MAINTAINER Daniel Malon <operations@sphonic.com>

ADD scripts /tmp/scripts
RUN cd /tmp && bash scripts/install.sh && sudo rm -rf /tmp/scripts
