#!/bin/bash

if [ $# -gt 0 ]; then
    /opt/apache/kafka/bin/kafka-topics.sh --create --zookeeper 33.33.33.2:2181 --replication-factor 3 --partition 1 --topic $1
else
    echo "Usage: create_topic.sh <topic_name>"
fi
