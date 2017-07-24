FROM dockerhub.qingcloud.com/hevienzdong/confd-jre8

WORKDIR /opt/elasticsearch
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ES_VERSION="elasticsearch-5.5.0" \
    PATH="/opt/elasticsearch/bin:$PATH"

RUN apk add --no-cache bash 'su-exec>=0.2'

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

COPY config/* ./config/ 

COPY docker-entrypoint.sh /

COPY bin/* /opt/elasticsearch/bin/
COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

VOLUME /opt/elasticsearch/data
EXPOSE 9200 9300


