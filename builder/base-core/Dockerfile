FROM ubuntu:trusty

MAINTAINER Daniel Malon <operations@sphonic.com>

ADD rootfs/etc /etc/
ADD rootfs/root /root/

RUN whoami && chown root:root /etc/sudoers && chmod 0440 /etc/sudoers

WORKDIR /root
USER root

ENV HOME /root
ENV LOGNAME root
ENV TERM xterm

ENV LANGUAGE en_US:en
ENV LANG C
ENV LC_ALL C
ENV LC_TYPE C

ADD scripts /tmp/scripts
RUN cd /tmp && bash scripts/install.sh && sudo rm -rf /tmp/scripts
