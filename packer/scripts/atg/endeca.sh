#!/bin/bash
sudo mount -t vboxsf vagrant /vagrant/

#Create installation root directory
sudo -u atgdev mkdir /home/atgdev/commerce/
#sudo chown -R atgdev:atgdev /home/atgdev/commerce/ 

export ACCEPT_LICENSE_AGREEMENT=true

#run weblogic installer
cd /vagrant/
sudo -u atgdev /vagrant/atg_installer/endeca/OCmdex6.5.1-Linux64_829811.sh --silent --target /home/atgdev/commerce/
sudo source endeca/MDEX/6.5.1/mdex_setup_sh.ini
#export LD_LIBRARY_PATH=/lib:${LD_LIBRARY_PATH}

sudo -u atgdev /vagrant/atg_installer/endeca/OCplatformservices11.1.0-Linux64.bin --silent --target /home/atgdev/commerce/ < /vagrant/packer/scripts/atg/platformsilent.rsp

sudo -u atgdev /vagrant/atg_installer/endeca/OCcas11.1.0-Linux64.sh --silent --target /home/atgdev/commerce/ < /vagrant/packer/scripts/atg/cassilent.txt

sudo -u atgdev /vagrant/atg_installer/endeca/cd/Disk1/install/silent_install.sh /vagrant/packer/scripts/atg/toolssilent.rsp ToolsAndFrameworks /home/atgdev/commerce/endeca/ToolsAndFrameworks admin

sudo cp workbench-init.d.sh /etc/init.d/workbench
sudo /sbin/chkconfig --add workbench

errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
