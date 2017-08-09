FROM dockerhub.qingcloud.com/qingcloud/confd-jre8:v0.13.7

WORKDIR /opt/elasticsearch
RUN addgroup -S elasticsearch && adduser -S -G elasticsearch elasticsearch

ENV ES_VERSION="elasticsearch-5.5.1" \
    PATH="/opt/elasticsearch/bin:$PATH"

RUN apk add --no-cache bash 'su-exec>=0.2' curl python

ADD $ES_VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch && mv /opt/$ES_VERSION /opt/elasticsearch

RUN elasticsearch-plugin install -s repository-s3
RUN elasticsearch-plugin install -s repository-hdfs
RUN elasticsearch-plugin install -s lang-javascript
RUN elasticsearch-plugin install -s lang-python

COPY docker-entrypoint.sh /

COPY bin/* /opt/elasticsearch/bin/
COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

ADD plugins/elasticsearch-analysis-ik-5.5.1.tar.gz /opt/elasticsearch/plugins
RUN elasticsearch-plugin install -b com.floragunn:search-guard-5:5.5.1-15

EXPOSE 9200 9300

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
