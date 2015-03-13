FROM ubuntu:trusty

MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

RUN \
  python3 -c "from urllib.request import urlretrieve; urlretrieve('https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.12.tgz','/tmp/mongodb.tgz')" && \
  gunzip -c /tmp/mongodb.tgz | tar -xC /tmp && \
  install -t /usr/bin /tmp/mongodb-linux-x86_64-2.4.12/bin/mongod && \
  mkdir -p /data/db /var/lib/mongodb && \
  rm -rf /tmp/mongodb*

EXPOSE 27017

ENTRYPOINT ["/usr/bin/mongod"]
CMD ["--noprealloc", "--smallfiles"]
