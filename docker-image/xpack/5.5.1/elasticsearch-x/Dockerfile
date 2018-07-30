FROM dockerhub.qingcloud.com/qingcloud/confd-ubuntu-jdk8:v1beta1

RUN apt-get update && apt-get install -y gosu python python-requests

WORKDIR /opt/elasticsearch
RUN addgroup --system elasticsearch && adduser --system --ingroup elasticsearch elasticsearch

ENV VERSION="elasticsearch-5.5.1" \
    PATH="/opt/elasticsearch/bin:$PATH"

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch && mv /opt/$VERSION /opt/elasticsearch

RUN elasticsearch-plugin install repository-s3
RUN elasticsearch-plugin install repository-hdfs
RUN elasticsearch-plugin install analysis-icu
RUN elasticsearch-plugin install analysis-kuromoji
RUN elasticsearch-plugin install analysis-phonetic
RUN elasticsearch-plugin install ingest-attachment
RUN elasticsearch-plugin install ingest-geoip
RUN elasticsearch-plugin install ingest-user-agent
RUN elasticsearch-plugin install mapper-murmur3
RUN elasticsearch-plugin install mapper-size
RUN elasticsearch-plugin install x-pack
RUN elasticsearch-plugin install https://github.com/NLPchina/elasticsearch-sql/releases/download/5.5.1.0/elasticsearch-sql-5.5.1.0.zip

ADD plugins/elasticsearch-analysis-ik-5.5.1.tar.gz /opt/elasticsearch/plugins
ADD plugins/elasticsearch-analysis-pinyin-5.5.1.tar.gz /opt/elasticsearch/plugins
RUN mkdir -p /opt/elasticsearch/plugins/analysis-ik/config/custom
COPY dicts/* /opt/elasticsearch/plugins/analysis-ik/config/custom/

COPY docker-entrypoint.sh /

COPY bin/* /opt/elasticsearch/bin/
COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

RUN rm -f /etc/confd/confd.toml

EXPOSE 9200 9300

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
