#!/bin/bash
sudo mount -t vboxsf vagrant /vagrant/

#Create installation root directory
#mkdir /home/atgdev/commerce/
#sudo chown -R atgdev:atgdev /home/atgdev/commerce/ 

export ACCEPT_LICENSE_AGREEMENT=true

#run ATG installers
/vagrant/atg_installer/atg/OCPlatform11.1.bin
/vagrant/atg_installer/atg/OCWebServerExtensions11.1.bin
/vagrant/atg_installer/atg/OCACC11.1.bin
/vagrant/atg_installer/atg/OCServiceCenter11.1.bin
/vagrant/atg_installer/atg/OCReferenceStore11.1.bin

errorlevel=$?

if [ "$errorlevel" != "0" ] && [ "$errorlevel" != "6" ]; then
  echo "There was an error preventing script from continuing"
  exit 1
fi
