FROM sphonic/base:trusty
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

RUN \
  add-apt-repository --yes ppa:jon-severinsson/ffmpeg   && \
  apt-get -qq update                                    && \
  apt-get install libtiff4-dev libpng-dev libjpeg-dev   && \
  apt-get install ffmpeg freeglut3-dev libfreetype6-dev && \

  apt-get -qq update                                    && \
  apt-get install gcc-4.7 g++-4.7 gobjc-4.7 gobjc++-4.7
