#!/bin/bash

# Fix timezone problems
if [[ $(cat /etc/timezone) != $TZ ]] ; then
	echo "$TZ" > /etc/timezone
	dpkg-reconfigure -f noninteractive tzdata
fi

# Rsync not existing glftpd files to volume host folder
rsync -avhr --ignore-existing /glftpd-inst/ /glftpd/
chown -R nobody:users /glftpd
