FROM dockerhub.qingcloud.com/qingcloud/confd-nodejs:v1beta1

WORKDIR /opt/elasticsearch-head

ENV VERSION="elasticsearch-head.20170808" \
    PATH="/opt/elasticsearch-head/bin:$PATH"

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch-head && mv /opt/$VERSION /opt/elasticsearch-head

RUN mkdir -p /opt/elasticsearch-head/bin
COPY bin/* /opt/elasticsearch-head/bin/

RUN rm -f /etc/confd/confd.toml

EXPOSE 9100

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
