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

cp /vagrant/config/server$1.properties /opt/apache/kafka/config/server.properties

/opt/apache/kafka/bin/kafka-server-start.sh /vagrant/config/server$1.properties &

exitscript
