# scylla-vm

## Local Scylla Db Cluster
To setup a local cluster we are going to use Vagrant and bash to build and start a Virtual box vm.
### Installing Vagrant
1st make sure vagrant is installed by following the link [here](https://www.vagrantup.com/downloads.html) or if you are using MacOsx you can use brew to install
```bash
$ brew cask install vagrant
```
### Installing VirtualBox and Extensions
```bash
$ brew cask install virtualbox
$ brew cask isntall virtualbox-extension-pack
```
### Create a Scylla Db Virtual Machine and Initialize
Vagrant requires each virtual machine to have its own working directory. You can create the working directory anywhere, but for new users, we recommend doing this in your user folder.  This can be accomplished by just cloning the repo:
```bash
$ cd ~/
$ git clone https://github.com/adevuyst/scylla-vm.git
```
After you have pulled down the vagrant files you can start your Scylla VM:
```bash 
$ cd scylla-vm
$ vagrant up
```
### Verifying The Scylla Db Setup and Interacting with Vagrant
SSH Into your vm
```bash
$ vagrant ssh 
```
Open up the Cassandra Query Language Shell
```bash
$ cqlsh 
```
