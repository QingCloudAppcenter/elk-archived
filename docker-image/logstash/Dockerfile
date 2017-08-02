FROM dockerhub.qingcloud.com/qingcloud/confd-jre8:v0.13.7

WORKDIR /opt/logstash

ENV LST_VERSION="logstash-5.5.1" \
    PATH="/opt/logstash/bin:$PATH"

RUN apk add --no-cache bash curl

ADD $LST_VERSION.tar.gz /opt
RUN rm -rf /opt/logstash && mv /opt/$LST_VERSION /opt/logstash

COPY bin/* /opt/logstash/bin/

COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

EXPOSE 9600

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
