FROM sphonic/base-core:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

RUN \
  add-apt-repository --yes ppa:jon-severinsson/ffmpeg   && \
  apt-get -qq update                                    && \
  apt-get install libtiff4-dev libpng-dev libjpeg-dev   && \
  apt-get install ffmpeg freeglut3-dev libfreetype6-dev && \

  apt-get -qq update                                    && \
  apt-get install gcc-4.8 g++-4.8 gobjc-4.8 gobjc++-4.8
