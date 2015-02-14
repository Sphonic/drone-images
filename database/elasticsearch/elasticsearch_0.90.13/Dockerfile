FROM jeanblanchard/busybox-java:7
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

ADD https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.13.tar.gz /tmp/

RUN \
  gunzip -c /tmp/elasticsearch-0.90.13.tar.gz | tar -xC /opt && \
  rm /tmp/elasticsearch-0.90.13.tar.gz

EXPOSE 9200

ENTRYPOINT ["/opt/elasticsearch-0.90.13/bin/elasticsearch"]
CMD ["-f", "-Des.index.store.type=memory"]
