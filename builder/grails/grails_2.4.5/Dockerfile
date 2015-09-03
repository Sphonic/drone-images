FROM sphonic/base-java:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

ADD rootfs/etc /etc/

ENV GROOVY_VERSION 2.3.11
ENV GRAILS_VERSION 2.4.5

ADD scripts /tmp/scripts
RUN cd /tmp && bash scripts/install.sh && sudo rm -rf /tmp/scripts
