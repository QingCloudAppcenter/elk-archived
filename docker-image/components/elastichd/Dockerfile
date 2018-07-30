FROM dockerhub.qingcloud.com/qingcloud/confd:v1beta1

WORKDIR /opt/elastichd

ENV PATH="/opt/elastichd/bin:$PATH"

RUN mkdir -p /opt/elastichd/bin
ADD ElasticHD /opt/elastichd/bin

COPY bin/* /opt/elastichd/bin/

RUN rm -f /etc/confd/confd.toml

EXPOSE 9800

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
