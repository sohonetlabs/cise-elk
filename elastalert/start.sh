#!/bin/bash

# Wait for elasticsearch to start
while ! nc -z elasticsearch 9200; do
  sleep 0.1 # wait for 1/10 of the second before check again
done

echo "Creating Elastalert index in Elasticsearch..."
elastalert-create-index --index elastalert_status --old-index "" --no-auth;

echo "Copying rules..."
for file in $(find /opt/sources -name '*.yaml' -or -name '*.yml');
do
  cp $file /opt/elastalert/rules
done

exec elastalert --verbose
