#!/bin/bash
sudo mount -t vboxsf vagrant /vagrant/

#Create installation root directory
sudo mkdir /opt/commerce
sudo chown -R atgdev:atgdev /opt/commerce 

#run weblogic installer
cd /vagrant
./OCmdex6.5.1-Linux64_829811.sh --silent --target /opt/commerce
source endeca/MDEX/6.5.1/mdex_setup_sh.ini
#export LD_LIBRARY_PATH=/lib:${LD_LIBRARY_PATH}
errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
