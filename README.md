vagrant-kafka-ubuntu
=============

Vagrant config to setup a partitioned Apache Kafka installation with clustered Apache Zookeeper

This configuration will start and provision 6 Ubuntu 12.04 VMs:
* Three Apache Zookeeper hosts configured on cluster
* Three Apache Kafka hosts with one broker each

Each host is provisioned with:

* JDK 7
* Kafka 0.8.1.1
* [kafkacat](https://github.com/edenhill/kafkacat)

Prerequisites
-------------------------
* [Vagrant](https://www.vagrantup.com)
* [VirtualBox](https://www.virtualbox.org)

Setup
-------------------------

To start it up, just git clone this repo and execute ```vagrant up```. Takes a while the first time as it will download all required dependencies for you.

Kafka is installed on ```/opt/apache/kafka```

Credit
-------------------------

A big thanks goes out to following projects below that served as the basis and inspiration for this project:

* [scala-kafka](https://github.com/stealthly/scala-kafka)
* [vagrant-kafka](https://github.com/eucuepo/vagrant-kafka)
