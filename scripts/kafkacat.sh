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

mkdir -p /opt/github/edenhill
chmod a+rw -R /opt/github/edenhill
cd /opt/github/edenhill
git clone https://github.com/edenhill/kafkacat.git
cd /opt/github/edenhill/kafkacat
./bootstrap.sh
cp kafkacat /usr/local/bin
exitscript
