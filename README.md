vagrant-kafka-ubuntu
=============

Vagrant config to setup a partitioned Apache Kafka installation with clustered Apache Zookeeper

This configuration will start and provision 6 Ubuntu 12.04 VMs:
* Three Apache Zookeeper hosts configured on cluster
* Three Apache Kafka hosts with one broker each

Each host is provisioned with JDK 7 and Kafka 0.8.1.1

Prerequisites
-------------------------
* Vagrant
* VirtualBox

Setup
-------------------------

To start it up, just git clone this repo and execute ```vagrant up```. Takes a while the first time as it will download all required dependencies for you.

Kafka is installed on ```/opt/apache/kafka```

Credit
-------------------------

This was heavily influenced by the following two projects

*https://github.com/stealthly/scala-kafka
*https://github.com/eucuepo/vagrant-kafka
