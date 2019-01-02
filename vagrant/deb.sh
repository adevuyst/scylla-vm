#!/bin/bash

set -e

if [ ! -d /tmp/vagrant-downloads ]; then
    mkdir -p /tmp/vagrant-downloads
fi
chmod a+rw /tmp/vagrant-downloads

### INSTALL FOR SCYLLA DB ###
# Based on the instructions here: https://www.scylladb.com/download/ubuntu-16-04/
# As of 2018-12-03

# Set the keys for the scylla repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6B2BFD3660EF3F5B
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 17723034C56D4B19

# Install the repository information
curl -o /etc/apt/sources.list.d/scylla.list -L http://repositories.scylladb.com/scylla/repo/27e87ad9-e6de-4d7b-a108-d40e22bbd94f/ubuntu/scylladb-3.0-xenial.list

# Install the scylla packages
apt-get update
apt-get install scylla -y


### INSTALL MONITORING STACK FOR SCYLLA DB ###
# Based on instructions from here: https://github.com/scylladb/scylla-grafana-monitoring
# As of 2018-12-03

# Install docker from the docker repositories
# Get dependencies
#apt-get update
#apt install apt-transport-https ca-certificates curl software-properties-common
# Add docker repo
#echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list
#Install docker packages
#apt-get update && apt-get install -y python-pip docker-ce git
#pip install --upgrade pip
#pip install pyyaml

chmod a+rw /opt

if [ ! -e /mnt ]; then
    mkdir /mnt
fi
chmod a+rwx /mnt


pushd /opt/
if [ ! -e scylla-monitoring ]; then
    pushd /tmp/vagrant-downloads
    if [ ! -e scylla-monitoring-2.0.tar.gz ]; then
        wget https://github.com/scylladb/scylla-grafana-monitoring/archive/scylla-monitoring-2.0.tar.gz
    fi
    popd

    tar xvzf /tmp/vagrant-downloads/scylla-monitoring-2.0.tar.gz
fi
ln -s /opt/scylla-monitoring-2.0 /opt/scylla-monitoring
popd


# Copy .profile and change owner to vagrant
# cp /vagrant/.profile /home/vagrant/
# chown vagrant:vagrant /home/vagrant/.profile

cp -r /vagrant/etc /mnt/
chown -R vagrant:vagrant /mnt/etc
mkdir -p /mnt/logs
chown -R vagrant:vagrant /mnt/logs

cp /vagrant/setup.sh /home/vagrant
chown vagrant:vagrant /home/vagrant/setup.sh
chmod +x /home/vagrant/setup.sh

#cp /vagrant/start.sh /home/vagrant
#chown vagrant:vagrant /home/vagrant/start.sh
#chmod +x /home/vagrant/start.sh

#cp /vagrant/clean_up.sh /home/vagrant
#chown vagrant:vagrant /home/vagrant/clean_up.sh
#chmod +x /home/vagrant/clean_up.sh
