FROM dockerhub.qingcloud.com/qingcloud/confd-nodejs:v1beta1

RUN apk add --no-cache nginx

WORKDIR /opt/kibana

ENV VERSION="kibana-5.5.1-linux-x86_64" \
    PATH="/opt/kibana/bin:$PATH"

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/kibana && mv /opt/$VERSION /opt/kibana

COPY bin/* /opt/kibana/bin/

COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

RUN mkdir -p /run/nginx

RUN rm -f /etc/confd/confd.toml

EXPOSE 5601

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
