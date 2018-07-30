FROM dockerhub.qingcloud.com/qingcloud/ubuntu-confd-jdk8:v0.13.8

WORKDIR /opt/elasticsearch
RUN addgroup --system elasticsearch && adduser --system --ingroup elasticsearch elasticsearch

ENV ES_VERSION="elasticsearch-6.1.1" \
    PATH="/opt/elasticsearch/bin:$PATH"

RUN apt-get update
RUN apt-get install -y curl netcat python vim gosu python-requests expect

ADD $ES_VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch && mv /opt/$ES_VERSION /opt/elasticsearch

RUN elasticsearch-plugin install -b repository-s3
RUN elasticsearch-plugin install -b repository-hdfs
RUN elasticsearch-plugin install -b analysis-icu
RUN elasticsearch-plugin install -b analysis-kuromoji
RUN elasticsearch-plugin install -b analysis-phonetic
RUN elasticsearch-plugin install -b ingest-attachment
RUN elasticsearch-plugin install -b ingest-geoip
RUN elasticsearch-plugin install -b ingest-user-agent
RUN elasticsearch-plugin install -b mapper-murmur3
RUN elasticsearch-plugin install -b mapper-size
RUN elasticsearch-plugin install -b x-pack

RUN elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.1.1/elasticsearch-analysis-ik-6.1.1.zip
RUN elasticsearch-plugin install -b https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v6.1.1/elasticsearch-analysis-pinyin-6.1.1.zip

RUN mkdir -p /opt/elasticsearch/config/analysis-ik/custom
COPY dicts/* /opt/elasticsearch/config/analysis-ik/custom/

COPY docker-entrypoint.sh /

COPY bin/* /opt/elasticsearch/bin/
COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

RUN rm -f /etc/confd/confd.toml

RUN printf "\n%s\n%s\n%s" "grant {" "        permission java.security.AllPermission;" "};" >> /etc/java-8-openjdk/security/java.policy

EXPOSE 9200 9300

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
