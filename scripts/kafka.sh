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

mkdir -p /opt/apache
cd /opt/apache
version=0.8.1.1
scala=2.10
release=kafka_$scala-$version
url=archive.apache.org/dist/kafka
wget https://$url/$version/$release.tgz
wget https://$url/$version/$release.tgz.md5
wget https://$url/$version/$release.tgz.sh1
wget https://$url/$version/$release.tgz.sh2
wget https://$url/$version/$release.tgz.asc
tar -xvf $release.tgz
ln -s /opt/apache/$release kafka
exitscript
