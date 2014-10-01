#!/bin/bash

if [ $# -gt 0 ]; then
    /opt/apache/kafka/bin/kafka-console-consumer.sh --from-beginning --topic $1 --zookeeper 33.33.33.2:2181 
else
    echo "Usage: consumer.sh <topic_name>"
fi
