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

apt-get -y update
apt-get -y install wget git gcc g++ zlib1g-dev zlib1g make curl screen vim software-properties-common python-software-properties ntp
add-apt-repository -y ppa:webupd8team/java
apt-get -y update
/bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get -y install oracle-java7-installer oracle-java7-set-default

#service ntp stop
#ntpdate ntp.ubuntu.com
#service ntp start


chmod a+rw -R /opt
chmod u+x /vagrant/scripts/*.sh

/vagrant/scripts/kafka.sh
/vagrant/scripts/kafkacat.sh

exitscript
