FROM dockerhub.qingcloud.com/qingcloud/confd-jre8:v0.13.7

WORKDIR /opt/elasticsearch-head

ENV VERSION="elasticsearch-head.20170808" \
    PATH="/opt/elasticsearch-head/bin:$PATH"

RUN apk add --no-cache bash nodejs nodejs-npm curl

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch-head && mv /opt/$VERSION /opt/elasticsearch-head

RUN mkdir -p /opt/elasticsearch-head/bin
COPY bin/* /opt/elasticsearch-head/bin/

RUN rm -f /etc/confd/confd.toml

EXPOSE 9100

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
