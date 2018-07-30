FROM dockerhub.qingcloud.com/qingcloud/confd-ubuntu-jdk8:v1beta1

WORKDIR /opt/logstash

ENV VERSION="logstash-5.4.3" \
    PATH="/opt/logstash/bin:$PATH"

ADD $VERSION.tar.gz /opt
RUN rm -rf /opt/logstash && mv /opt/$VERSION /opt/logstash

RUN sed -i 's,source "https://rubygems.org",source "https://gems.ruby-china.org",' /opt/logstash/Gemfile

RUN mkdir -p /opt/logstash/plugins
COPY plugins/qingstor-sdk-1.9.3.gem /opt/logstash/plugins
COPY plugins/logstash-input-qingstor-0.1.2.gem /opt/logstash/plugins
COPY plugins/logstash-output-qingstor-0.3.4.gem /opt/logstash/plugins

RUN JRUBY_OPTS="-J-Djava.security.egd=file:/dev/urandom" logstash-plugin install --no-verify --local /opt/logstash/plugins/qingstor-sdk-1.9.3.gem
RUN JRUBY_OPTS="-J-Djava.security.egd=file:/dev/urandom" logstash-plugin install --no-verify --local /opt/logstash/plugins/logstash-input-qingstor-0.1.2.gem
RUN JRUBY_OPTS="-J-Djava.security.egd=file:/dev/urandom" logstash-plugin install --no-verify --local /opt/logstash/plugins/logstash-output-qingstor-0.3.4.gem

COPY config/* /opt/logstash/config/
COPY bin/* /opt/logstash/bin/

COPY confd.d/* /etc/confd/conf.d/
COPY templates/*  /etc/confd/templates/

RUN rm -f /opt/logstash/Gemfile.jruby-1.9.lock
RUN rm -f /etc/confd/confd.toml

EXPOSE 9600

ENTRYPOINT ["/opt/qingcloud/app-agent/bin/confd"]
