#!/bin/bash
#########################################
## ENVIRONMENTAL CONFIG ##
#########################################

# Configure user nobody to match unRAID's settings
usermod -u 99 nobody
usermod -g 100 nobody
usermod -d /home nobody
chown -R nobody:users /home

# Disable SSH
rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

#########################################
## REPOSITORIES AND DEPENDENCIES ##
#########################################

# Install Dependencies
apt-get update -qq
apt-get install -qy ftp nano rsync tcl tcl-dev tcpd unzip wget xinetd zip

#########################################
## INSTALLATION ##
#########################################

# define glftpd version
glftpdv="glftpd-LNX-2.05.2_1.0.1e-2+deb7u15_x64"

#Fetch glftpd archive
cd /
wget http://glftpd.eu/files/${glftpdv}.tgz
if [ -f ${glftpdv}.tgz ]; then
	tar -zxvf ${glftpdv}.tgz
	cp /tmp/autoinst.sh /${glftpdv}/
	cd ${glftpdv}
	chmod +x autoinst.sh
	./autoinst.sh
	cd /
	cp -rf glftpd glftpd-inst
	chown -R nobody:users glftpd-inst
	rm -rf ${glftpdv}
	rm ${glftpdv}.tgz
else
	exit 1
fi

#########################################
## CLEANUP ##
#########################################

# Clean APT install files
apt-get clean -y
rm -rf /var/lib/apt/lists/* /var/cache/* /var/tmp/*
