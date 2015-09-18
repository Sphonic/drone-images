FROM sphonic/base-java:20150918

MAINTAINER Daniel Malon <operations@sphonic.com>

ADD rootfs/etc /etc/

ENV GROOVY_VERSION 2.2.2
ENV GRAILS_VERSION 2.3.5

ADD scripts /tmp/scripts
RUN cd /tmp && bash scripts/install.sh && sudo rm -rf /tmp/scripts
