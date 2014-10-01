#!/bin/bash -Eux

# Trap non-normal exit signals: 1/HUP, 2/INT, 3/QUIT, 15/TERM, ERR
trap founderror 1 2 3 15 ERR

founderror()
{
  exit 1
}

exitscript()
{
  exit 0
}

if [ ! -d /tmp/zookeeper ]; then
    echo creating zookeeper data dir...
    mkdir /tmp/zookeeper
    echo $1 > /tmp/zookeeper/myid
fi

cp /vagrant/config/zookeeper.properties /opt/apache/kafka/config/zookeeper.properties

/opt/apache/kafka/bin/zookeeper-server-start.sh /opt/apache/kafka/config/zookeeper.properties > /tmp/zookeeper.log &
