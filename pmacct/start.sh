#!/bin/bash

# Create exchange in RabbitMQ early
while ! nc -z rabbitmq 15672; do   
  sleep 0.1 # wait for 1/10 of the second before check again
done
curl -i -u guest:guest -H "content-type:application/json" -XPUT -d'{"type":"fanout","durable":false}' http://rabbitmq:15672/api/exchanges/%2f/pmacct

# Create dummy pmacct data
curl http://rabbitmq:15672/cli/rabbitmqadmin > /rabbitmqadmin
cat /event.json | python /rabbitmqadmin -H rabbitmq -u guest -p guest publish exchange=pmacct routing_key="" payload_encoding=""

/usr/bin/supervisord
