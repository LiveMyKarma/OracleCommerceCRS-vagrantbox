# OracleCommerceCRS-vagrantbox
Get up and running with Oracle Commerce 11 including CRS with one click installation

I am really excited about this!!! It's my effort to build a portable development environment with Oracle Commerce 11.

It is a work in progress. Feel free to download and use it (which will require manual installation at this point).

I will be highly grateful to your feedback and contributions. Join my mailing list <a href="https://groups.google.com/d/forum/oraclecommercedev">OracleCommerceDev</a>


## Prerequisites

### VirtualBox

http://virtualbox.com

### Packer

http://packer.io

### Vagrant

http://vagrantup.com

### Oracle Linux 6.5

1. Download Oracle Linux 6.6 DVD ISO
2. Rename and move it to packer/oracle_linux_6.6.iso

### Oracle 12cR1

1. Download Database Install files (1 and 2) - http://www.oracle.com/technetwork/database/enterprise-edition/downloads/database12c-linux-download-1959253.html
2. Place the zip archives in database_installer/

### Java

1. Download JDK 7u71
2. Put it in atg_installer

### Download Weblogic

1. Download weblogic 12c generic server with coherence
http://www.oracle.com/technetwork/middleware/fusion-middleware/downloads/index.html
2. Place the JAR file in atg_installer

### Download Oracle Commerce 11.1.0 and put it in atg_installer

1. Download the following files from https://edelivery.oracle.com

	Platform 11.1<br/>
	ACC 11.1<br/>
	Service Center 11.1<br/>
	Web Server Extensions 11.1<br/>
	Reference Store 11.1<br/>
	Assisted Selling Application 11.1 for Generic Platform<br/>

2. Extract all the files into atg_installer/atg
3. Download the following files from https://edelivery.oracle.com

	MDEX Engine 6.5.1<br/>
	Content Acquisition System 11.1<br/>
	Experience Manager Tools and Frameworks 11.1<br/>
	Tools and Frameworks 11.1<br/>
	Guided Search Platform Services 11.1<br/>

4. Extract all the files in atg_installer/endeca

This will create 2 vagrant box one with Oracle DB and other with Oracle Commerce 11.1.0 with Weblogic 12c.
So far installation of JDK, weblogic and Endeca is automated and ATG installers are required to be run manually.

### Build boxes
1. Run buildbox.bat on windows or buildbox.sh on linux. It will create a VM with Oracle linux 6.6
2. Copy the OVF file from packer/packer_output folder into packer folder abnd delete the packer/packer_output folder
3. Run buildDB.bat on windows or buildDB.sh on linux. It will create a VM and vagrant box with Oracle 12c database
4. Run buildDB.bat on windows or buildDB.sh on linux. It will create a VM and vagrant box with JDK, Weblogic and Endeca installed.
5. Manually install ATG 11 (TDB)
