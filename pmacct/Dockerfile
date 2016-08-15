FROM ubuntu:14.04
MAINTAINER Johan van den Dorpe <johan.vandendorpe@sohonet.com>

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y sudo wget build-essential libjansson-dev libnuma-dev librdkafka-dev libpcap-dev librabbitmq-dev curl

RUN wget http://www.pmacct.net/pmacct-1.5.3.tar.gz \
  && tar xvzf pmacct-1.5.3.tar.gz \
  && cd pmacct-1.5.3 \
  && ./configure --enable-jansson --enable-rabbitmq --enable-kafka --enable-ipv6 --enable-plabel --enable-64bit --enable-threads --prefix=/opt/pmacct \
  && make -j 4\
  && make install

COPY sfacctd.conf /opt/pmacct/
COPY sflow_agent.conf /opt/pmacct/
COPY start.sh /
CMD ["/start.sh"]
