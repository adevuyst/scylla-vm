# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define "deb" do |deb|
    deb.vm.box = "ubuntu/xenial64"
    deb.vm.network "forwarded_port", guest: 9042, host: 9042
    deb.vm.network "forwarded_port", guest: 7000, host: 7000
    deb.vm.network "forwarded_port", guest: 7001, host: 7001
    deb.vm.network "forwarded_port", guest: 9180, host: 9180
    deb.vm.network "forwarded_port", guest: 7199, host: 7199
    deb.vm.network "forwarded_port", guest: 7000, host: 9093
    deb.vm.network "forwarded_port", guest: 7000, host: 9100
    deb.vm.provision "shell", path: "vagrant/deb.sh"
    deb.vm.provision "shell", path: "setup.sh", run: "always", privileged: false
    #deb.vm.provision "shell", path: "start.sh", run: "always", privileged: false


  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

end
