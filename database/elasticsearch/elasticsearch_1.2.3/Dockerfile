FROM jeanblanchard/busybox-java:7
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.3.tar.gz /tmp/

RUN \
  gunzip -c /tmp/elasticsearch-1.2.3.tar.gz | tar -xC /opt && \
  rm /tmp/elasticsearch-1.2.3.tar.gz

EXPOSE 9200

ENTRYPOINT ["/opt/elasticsearch-1.2.3/bin/elasticsearch"]
CMD ["-Des.index.store.type=memory"]
