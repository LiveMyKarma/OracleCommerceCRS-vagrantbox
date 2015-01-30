#!/bin/bash -eux

sudo mount -t vboxsf vagrant /vagrant/

#sudo mkdir /home/atgdev/appserver
#sudo chgrp atgdev /opt/appserver
#sudo chown atgdev /opt/appserver/

#Install JDK
sudo -u atgdev tar zxvf /vagrant/atg_installer/jdk-7u71-linux-x64.gz -C /home/atgdev/
errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi

