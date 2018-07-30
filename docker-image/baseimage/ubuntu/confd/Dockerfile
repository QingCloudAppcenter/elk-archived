FROM ubuntu:16.04

RUN apt-get update && apt-get install -y netcat

RUN mkdir -p /opt/qingcloud/app-agent/bin/
ADD confd-linux-amd64.v0.13.12.tar.gz /opt/qingcloud/app-agent/bin/

ADD root /
RUN chmod +x /opt/qingcloud/app-agent/bin/*.sh

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
