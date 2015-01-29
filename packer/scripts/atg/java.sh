#!/bin/bash
sudo mount -t vboxsf vagrant /vagrant/

sudo mkdir /opt/appserver
sudo chgrp atgdev /opt/appserver
sudo chown atgdev /opt/appserver/

#Install JDK
cd /opt/appserver
sudo -Eu atgdev tar zxvf /vagrant/atg_installer/jdk-7u71-linux-x64.gz
errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
