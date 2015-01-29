#!/bin/bash
sudo mount -t vboxsf vagrant /vagrant/

#copy in atgdev .bash_profile
sudo cp /vagrant/packer/scripts/atg/.bash_profile /home/atgdev/.bash_profile 
sudo cp /vagrant/packer/scripts/atg/oraInst.loc /etc/oraInst.loc 

sudo -Eu atgdev mkdir /opt/appserver/wlserver
sudo -Eu atgdev mkdir /opt/appserver/wlserver/oraInventory
#run weblogic installer
sudo -Eu atgdev /opt/appserver/jdk1.7.0_71/bin/java -jar -d64 /vagrant/atg_installer/fmw_12.1.3.0.0_wls.jar -silent -waitforcompletion -ignoreSysPrereqs -invPtrLoc /etc/oraInst.loc -responseFile /vagrant/packer/scripts/atg/response.file.rsp

errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
