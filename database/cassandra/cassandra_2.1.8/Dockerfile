FROM jeanblanchard/busybox-java:7

MAINTAINER Daniel Malon <operations@sphonic.com>

WORKDIR /root
USER root

RUN \
  curl -Lo /tmp/apache-cassandra-2.1.8-bin.tar.gz http://www.eu.apache.org/dist/cassandra/2.1.8/apache-cassandra-2.1.8-bin.tar.gz && \
  gunzip -c /tmp/apache-cassandra-2.1.8-bin.tar.gz | tar -xC /opt && \
  mv /opt/apache-cassandra-2.1.8 /opt/cassandra                   && \
  rm -rf /tmp/apache-cassandra-2.1.8-bin.tar.gz                   && \
  sed -i -e "s/num_tokens/\#num_tokens/" /opt/cassandra/conf/cassandra.yaml

EXPOSE 7199 7000 7001 9160 9042

CMD [""]

ADD scripts/cassandra-singlenode.sh /usr/local/bin/cassandra-singlenode

ENTRYPOINT ["/usr/local/bin/cassandra-singlenode"]
