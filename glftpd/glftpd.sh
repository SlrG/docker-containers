#!/bin/bash
rsync -avhr --ignore-existing /glftpd-inst/ /glftpd/
chown -R nobody:users /glftpd
service xinetd start
