#!/bin/bash

# Creates a container using an Ubuntu Cloud LXC template and then
# imports into Docker. This will provide an image that
# is nearly identical to an Amazon (or Rackspace) Ubuntu AMI.

export LANGUAGE=en_US:en
export LANG=C
export LC_ALL=C
export LC_TYPE=C

DOCKER_USER=${DOCKER_USER:="sphonic"}
UBUNTU_RELEASE=${UBUNTU_RELEASE:="trusty"}
CONTAINER_NAME=ubuntu
CONTAINER_DIR=/var/lib/lxc/${CONTAINER_NAME}/rootfs

# make sure container and image don't already exist
lxc-info -n ${CONTAINER_NAME} 2>/dev/null
if [[ $? -eq 0 ]]; then
  lxc-stop -n ${CONTAINER_NAME} 2>/dev/null
  lxc-destroy -n ${CONTAINER_NAME}
fi
docker rmi ${DOCKER_USER}/${CONTAINER_NAME}:${UBUNTU_RELEASE} 2>/dev/null

# create the default LXC container
lxc-create -n ${CONTAINER_NAME} -t ubuntu-cloud -- -r ${UBUNTU_RELEASE}

# upstart workaround for docker
# see https://github.com/dotcloud/docker/issues/1024
chroot ${CONTAINER_DIR} dpkg-divert --local --rename --add /sbin/initctl
chroot ${CONTAINER_DIR} ln -s /bin/true /sbin/initctl

# import the container into docker
tar -c -C ${CONTAINER_DIR} . | docker import - ${DOCKER_USER}/${CONTAINER_NAME}:${UBUNTU_RELEASE}

# cleanup after ourselves ...
# destroy the container
lxc-destroy -n ${CONTAINER_NAME}
