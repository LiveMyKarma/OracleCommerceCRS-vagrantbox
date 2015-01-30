#!/bin/bash -eux

sudo mount -t vboxsf vagrant /vagrant/

sudo -u atgdev mkdir /home/atgdev/wlserver
sudo -u atgdev mkdir /home/atgdev/wlserver/oraInventory
#run weblogic installer
sudo -u atgdev /home/atgdev/jdk1.7.0_71/bin/java -jar -d64 /vagrant/atg_installer/fmw_12.1.3.0.0_wls.jar -silent -waitforcompletion -ignoreSysPrereqs -invPtrLoc /etc/oraInst.loc -responseFile /vagrant/packer/scripts/atg/wlresponse.rsp

errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
