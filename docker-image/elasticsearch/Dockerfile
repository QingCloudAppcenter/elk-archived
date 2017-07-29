FROM dockerhub.qingcloud.com/hevienzdong/confd-jre8

WORKDIR /opt/elasticsearch
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ES_VERSION="elasticsearch-5.5.1" \
    PATH="/opt/elasticsearch/bin:$PATH"

RUN apk add --no-cache bash 'su-exec>=0.2' curl python

ADD $ES_VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch && mv /opt/$ES_VERSION /opt/elasticsearch

RUN set -ex; \
	mkdir -p ./plugins; \
	for path in \
		./data \
		./logs \
		./config \
		./config/scripts \
	; do \
		mkdir -p "$path"; \
		chown -R elasticsearch:elasticsearch "$path"; \
	done;

RUN elasticsearch-plugin install -s repository-s3
RUN elasticsearch-plugin install -s repository-hdfs

COPY docker-entrypoint.sh /

COPY bin/* /opt/elasticsearch/bin/
COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

VOLUME /opt/elasticsearch/data
EXPOSE 9200 9300

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
