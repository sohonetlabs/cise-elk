FROM ubuntu:14.04
MAINTAINER Johan van den Dorpe <johan.vandendorpe@sohonet.com>

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y sudo wget build-essential libjansson-dev libnuma-dev librdkafka-dev libpcap-dev librabbitmq-dev

RUN wget http://www.pmacct.net/pmacct-1.5.3.tar.gz \
  && tar xvzf pmacct-1.5.3.tar.gz \
  && cd pmacct-1.5.3 \
  && ./configure --enable-jansson --enable-rabbitmq --enable-kafka --enable-ipv6 --enable-plabel --prefix=/opt/pmacct \
  && make \
  && make install

COPY sfacctd.conf /opt/pmacct/
CMD ["/opt/pmacct/sbin/sfacctd", "-f", "/opt/pmacct/sfacctd.conf"]
