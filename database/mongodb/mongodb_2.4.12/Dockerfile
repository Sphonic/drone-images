FROM ubuntu:trusty

MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ADD https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.12.tgz /tmp/

RUN \
  gunzip -c /tmp/mongodb-linux-x86_64-2.4.12.tgz | tar -xC /tmp && \
  install -t /usr/bin /tmp/mongodb-linux-x86_64-2.4.12/bin/mongod && \
  mkdir -p /data/db /var/lib/mongodb && \
  rm -rf /tmp/mongodb-linux-x86_64-2.4.12*

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]
CMD ["--noprealloc", "--smallfiles"]
