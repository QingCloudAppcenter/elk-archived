FROM dockerhub.qingcloud.com/qingcloud/confd-jre8:v0.13.7

RUN apk add --no-cache bash curl

WORKDIR /opt/elastichd

ENV PATH="/opt/elastichd/bin:$PATH"

RUN mkdir -p /opt/elastichd/bin
ADD ElasticHD /opt/elastichd/bin

COPY bin/* /opt/elastichd/bin/

EXPOSE 9800

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
