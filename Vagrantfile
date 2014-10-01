# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  timezone = 'America/New_York'
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.ssh.forward_agent = true
  config.vm.provision "shell", inline: "if [ $(grep -c UTC /etc/timezone) -gt 0 ]; then echo \"#{timezone}\" | sudo tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata; fi"
  config.vm.provision "shell", path: "scripts/init.sh"

  # configure zookeeper cluster
  (1..3).each do |i|
    config.vm.define "zookeeper#{i}" do |s|
      s.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", "1024"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.name = "zookeeper#{i}"
      end
      s.vm.hostname = "zookeeper#{i}"
      s.vm.network "private_network", ip: "33.33.33.#{i+1}"
      s.vm.network :forwarded_port, guest: 2181, host: "218#{1 + (i - 1)}"
      s.vm.provision "shell", path: "scripts/zookeeper.sh", args:"#{i}", privileged: "false", run: "always"
    end
  end

  # configure brokers
  (1..3).each do |i|
    config.vm.define "broker#{i}" do |s|
      s.vm.provider :virtualbox do |v|
        v.gui = false
        v.customize ["modifyvm", :id, "--memory", "1024"]
        v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
        v.name = "broker#{i}"
      end
      s.vm.hostname = "broker#{i}"
      s.vm.network "private_network", ip: "33.33.33.#{4-i}0"
      s.vm.network :forwarded_port, guest: 9092, host: "909#{2 + (i-1)}"
      s.vm.provision "shell", path: "scripts/broker.sh", args:"#{i}", privileged: "false", run: "always"
    end
  end
end
