# Data collection configs

## DNS collection

DNS collection is performed by packetbeat, an elastic product. It is a real time network packet analyser. We use it to listen to DNS traffic on port 53, and ship the results to logstash.

To install packetbeat , follow the installation instructions here: https://www.elastic.co/guide/en/beats/packetbeat/current/packetbeat-installation.html

The packetbeat config file can be found in `collection/dns` - there is a slight different version for windows and linux. This file must be modified with the correct IP address and port from the logstash collector host in your environment.

Copy the config to either `/etc/packetbeat/packetbeat.yml` or `C:\Program Files\Packetbeat\packetbeat.yml` and start the packetbeat service to start sending DNS queries to logstash.