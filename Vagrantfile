# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "scylla" do |scylla|
    scylla.vm.box = "ubuntu/xenial64"
    scylla.vm.network "forwarded_port", guest: 9042, host: 9042
    scylla.vm.network "forwarded_port", guest: 7000, host: 7000
    scylla.vm.network "forwarded_port", guest: 7001, host: 7001
    scylla.vm.network "forwarded_port", guest: 9180, host: 9180
    scylla.vm.network "forwarded_port", guest: 7199, host: 7199
    scylla.vm.network "forwarded_port", guest: 7000, host: 9093
    scylla.vm.network "forwarded_port", guest: 7000, host: 9100
    scylla.vm.provision "shell", path: "vagrant/deb.sh"
    scylla.vm.provision "shell", path: "setup.sh", privileged: false
    scylla.vm.provision "shell", path: "start.sh", run: "always", privileged: false

  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

end
