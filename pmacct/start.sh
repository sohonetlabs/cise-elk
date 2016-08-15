#!/bin/bash

# Create exchange in RabbitMQ early
while ! nc -z rabbitmq 15672; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done
curl -i -u guest:guest -H "content-type:application/json" -XPUT -d'{"type":"fanout","durable":false}' http://rabbitmq:15672/api/exchanges/%2f/pmacct

/opt/pmacct/sbin/sfacctd -f /opt/pmacct/sfacctd.conf
