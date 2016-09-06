FROM python:2.7
MAINTAINER Johan van den Dorpe <johan.vandendorpe@sohonet.com>

RUN wget https://github.com/Yelp/elastalert/archive/v0.0.95.tar.gz && \
    tar xvzf *.tar.gz && \
    mv -- elast* /opt/elastalert && \
    rm -rf *.tar.gz

WORKDIR /opt/elastalert
RUN mkdir /opt/elastalert/rules

RUN apt-get update && apt-get install -y netcat

RUN pip install -r requirements.txt && python setup.py install
COPY config.yaml /opt/elastalert
COPY start.sh /
CMD [ "/start.sh" ]
