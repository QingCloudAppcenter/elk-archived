FROM dockerhub.qingcloud.com/hevienzdong/openjdk:8-jre-alpine


WORKDIR /opt/elasticsearch


ENV CONFD_VERSION="v0.13.7" \
    ELASTICSEARCH_VERSION="5.5.0" \
    ELASTICSEARCH_TARBALL="https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.tar.gz" \ 
    ELASTICSEARCH_TARBALL_SHA1="d79a3ade8b8589d13aeb99ceec1c54683596e88b" \
    PATH="/opt/elasticsearch/bin:$PATH"


RUN apk add --no-cache curl bash 'su-exec>=0.2' ca-certificates gnupg openssl tar


# Install Confd
RUN set -ex; \
    mkdir -p /opt/qingcloud/app-agent/bin/; \
    wget -O confd.tar.gz https://github.com/yunify/confd/releases/download/$CONFD_VERSION/confd-alpine-amd64.tar.gz; \
    tar -xzf confd.tar.gz -C /opt/qingcloud/app-agent/bin/; \
    rm confd.tar.gz;

ADD root /
RUN chmod +x /opt/qingcloud/app-agent/bin/*.sh

COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/
# End install Confd


# Install ElasticSearch
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch
RUN set -ex; \
	wget -O elasticsearch.tar.gz "$ELASTICSEARCH_TARBALL"; \
	if [ "$ELASTICSEARCH_TARBALL_SHA1" ]; then \
		echo "$ELASTICSEARCH_TARBALL_SHA1 *elasticsearch.tar.gz" | sha1sum -c -; \
	fi; \
	tar -xf elasticsearch.tar.gz --strip-components=1; \
	rm elasticsearch.tar.gz; \
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
COPY bin/* /opt/elasticsearch/bin/
# End install ElasticSearch


COPY docker-entrypoint.sh /

VOLUME /opt/elasticsearch/data

EXPOSE 9200 9300
ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]

