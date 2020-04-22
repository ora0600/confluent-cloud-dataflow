#!/bin/bash

###### set environment variables
source env-vars
# CCloud environment CMWORKSHOPS
CCLOUD_CLUSTERID1=$(sed 's/|//g' clusterid1 | awk '/Id/{print $NF}')
CCLOUD_CLUSTERID1_BOOTSTRAP=$(sed 's/|//g' clusterid1 | awk '/Endpoint     SASL_SSL:\/\//{print $NF}' | sed 's/SASL_SSL:\/\///g')
CCLOUD_KEY1=$(awk '/key/{print $NF}' apikey1)

# drop topic in ccloud
kafka-topics --delete --bootstrap-server $CCLOUD_CLUSTERID1_BOOTSTRAP --topic cmorders --command-config ./ccloud_user1.properties 

# DELETE CCLOUD cluster 
cd /Users/cmutzlitz/Demos/ccloud/unpack_and_execute_produce4dataflow
ccloud login
# environment CMWorkshops
ccloud environment use $XX_CCLOUD_ENV

# delete API Key
ccloud api-key delete $CCLOUD_KEY1

# Delete cluster
ccloud kafka cluster delete $CCLOUD_CLUSTERID1

# Delete files
rm basedir
rm apikey1
rm ccloud_user1.properties
rm clusterid1
# Finish
echo "Cluster $XX_CCLOUD_CLUSTERNAME dropped"