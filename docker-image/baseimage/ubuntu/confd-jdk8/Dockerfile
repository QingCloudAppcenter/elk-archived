FROM dockerhub.qingcloud.com/qingcloud/confd-ubuntu:v1beta1

RUN apt-get update && apt-get install -y openjdk-8-jdk

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
