#!/bin/bash

# set titke
export PROMPT_COMMAND='echo -ne "\033]0;Consume from ccloud: Normal\007"'
echo -e "\033];Consume from ccloud: Normal\007"

#consume terminal 2
kafka-console-consumer --topic cmorders --consumer.config ./ccloud_user1.properties --bootstrap-server $(sed 's/|//g' clusterid1 | awk '/Endpoint     SASL_SSL:\/\//{print $NF}' | sed 's/SASL_SSL:\/\///g') --property print.timestamp=true --consumer-property group.id=cmorders_consumer
