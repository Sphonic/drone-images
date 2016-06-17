FROM sphonic/base-core:20150219

MAINTAINER Hugh Simpson <operations@sphonic.com>

ENV PYENV_VERSION 2.7.9

RUN /bin/bash /etc/drone.d/pyenv.sh

RUN /root/.pyenv/shims/pip install ansible==2.1.0.0

