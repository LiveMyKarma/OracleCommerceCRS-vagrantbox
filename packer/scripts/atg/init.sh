#!/bin/bash

sudo groupadd atgdev
sudo useradd -g atgdev atgdev
sudo passwd atgdev
sudo su - atgdev

sudo mkdir /vagrant
sudo mount -t vboxsf vagrant /vagrant/

#prerequisites
sudo cp /vagrant/packer/scripts/atg/hosts /etc/hosts
sudo cp /vagrant/packer/scripts/atg/network /etc/sysconfig/network
sudo /etc/init.d/network restart

sudo hostname -v atgdev.localdomain

errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
