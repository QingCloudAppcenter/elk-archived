FROM dockerhub.qingcloud.com/qingcloud/confd-jdk8:v1beta1

WORKDIR /opt/cerebro

ENV VERSION="cerebro-0.7.1" \
    PATH="/opt/cerebro/bin:$PATH"

ADD $VERSION.tgz /opt
RUN rm -rf /opt/cerebro && mv /opt/$VERSION /opt/cerebro

COPY bin/* /opt/cerebro/bin/

RUN rm -f /etc/confd/confd.toml

EXPOSE 9000

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
