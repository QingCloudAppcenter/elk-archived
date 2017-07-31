FROM dockerhub.qingcloud.com/hevienzdong/confd-jre8

WORKDIR /opt/kibana

ENV KBN_VERSION="kibana-5.5.1-linux-x86_64" \
    PATH="/opt/kibana/bin:$PATH"

RUN apk add --no-cache bash nodejs curl

ADD $KBN_VERSION.tar.gz /opt
RUN rm -rf /opt/kibana && mv /opt/$KBN_VERSION /opt/kibana

COPY bin/* /opt/kibana/bin/

COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

EXPOSE 5601

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
