FROM dockerhub.qingcloud.com/qingcloud/confd-nodejs:v1beta1

WORKDIR /opt/elasticsearch-sql

ENV VERSION="es-sql" \
    PATH="/opt/elasticsearch-sql/bin:$PATH"

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/elasticsearch-sql && mv /opt/$VERSION /opt/elasticsearch-sql

RUN mkdir -p /opt/elasticsearch-sql/bin
COPY bin/* /opt/elasticsearch-sql/bin/

RUN rm -f /etc/confd/confd.toml

EXPOSE 8080

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
