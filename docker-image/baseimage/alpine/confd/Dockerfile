FROM alpine:3.7

RUN apk add --no-cache bash curl

RUN mkdir -p /opt/qingcloud/app-agent/bin/
ADD confd-alpine-amd64.v0.13.12.tar.gz /opt/qingcloud/app-agent/bin/

ADD root /
RUN chmod +x /opt/qingcloud/app-agent/bin/*.sh

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
