#!/bin/bash

if [ $# -gt 0 ]; then
    /opt/apache/kafka/bin/kafka-console-producer.sh --broker-list 33.33.33.10:9092,33.33.33.20:9092,33.33.33.30:9092 --topic $1
else
    echo "Usage: producer.sh <topic_name>"
fi
