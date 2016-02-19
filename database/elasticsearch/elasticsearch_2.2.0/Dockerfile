FROM jeanblanchard/busybox-java:7
MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root


RUN \
  curl -kL -o /tmp/elasticsearch.tar.gz https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-2.2.0.tar.gz && \
  gunzip -c /tmp/elasticsearch.tar.gz | tar -xC /opt && \
  rm /tmp/elasticsearch.tar.gz

EXPOSE 9200 9300

ENTRYPOINT ["/opt/elasticsearch-2.2.0/bin/elasticsearch"]
CMD [ \
  "-Des.insecure.allow.root=true", \
  "-Des.network.host=0.0.0.0", \
  "-Des.index.store.type=memory", \
  "-Des.script.inline=true" \
]
