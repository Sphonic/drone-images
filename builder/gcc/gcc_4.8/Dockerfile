FROM sphonic/base-core:20150918

MAINTAINER Daniel Malon <operations@sphonic.com>

RUN \
  apt-get -yqq update                                   && \
  apt-get install libtiff5-dev libpng-dev libjpeg-dev   && \
  apt-get install ffmpeg freeglut3-dev libfreetype6-dev && \

  apt-get install gcc-4.8 g++-4.8 gobjc-4.8 gobjc++-4.8
