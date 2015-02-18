#!/bin/bash -eux
sudo mkdir /vagrant
sudo mount -t vboxsf vagrant /vagrant/

sudo groupadd atgdev
sudo useradd -g atgdev atgdev
echo "atgpwd" | sudo passwd atgdev --stdin

#prerequisites
sudo cp /vagrant/packer/scripts/atg/hosts /etc/hosts
sudo cp /vagrant/packer/scripts/atg/network /etc/sysconfig/network
sudo /etc/init.d/network restart

echo "atgdev        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers

#copy in atgdev .bash_profile
sudo -u atgdev cp /vagrant/packer/scripts/atg/.bash_profile /home/atgdev/.bash_profile
sudo cp /vagrant/packer/scripts/atg/oraInst.loc /etc/oraInst.loc
sudo chown atgdev:atgdev /etc/oraInst.loc


