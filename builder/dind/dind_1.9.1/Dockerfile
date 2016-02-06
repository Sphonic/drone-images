FROM sphonic/base-java:20150219

MAINTAINER Daniel Malon <operations@sphonic.com>

VOLUME /var/lib/docker

ENV DOCKER_VERSION 1.9.1
ENV DOCKER_DAEMON_ARGS -l error

RUN apt-get update -yy && \
    apt-get install iptables && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD wrapdocker.sh /etc/drone.d/wrapdocker.sh

RUN curl -Lo /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION} && \
    curl -Lo /usr/bin/dind https://raw.githubusercontent.com/docker/docker/v${DOCKER_VERSION}/hack/dind && \
    chmod +x /usr/bin/docker && \
    chmod +x /usr/bin/dind
