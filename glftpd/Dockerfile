FROM phusion/baseimage:0.9.15
MAINTAINER SlrG <michael_wehr@web.de>

#########################################
## ENVIRONMENTAL CONFIG ##
#########################################

# Set correct environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#########################################
## FILES, SERVICES AND CONFIGURATION ##
#########################################

# Add files
ADD autoinst.sh /tmp/
ADD config.sh /etc/my_init.d/

# Add services to runit
ADD glftpd.sh /etc/service/glftpd/run
RUN chmod +x /etc/service/*/run /etc/my_init.d/*

#########################################
## EXPORTS AND VOLUMES ##
#########################################

#Path to a directory that contains the glftpd installation
VOLUME /glftpd

#########################################
## RUN INSTALL SCRIPT ##
#########################################
ADD install.sh /tmp/
RUN chmod +x /tmp/install.sh && /tmp/install.sh && rm /tmp/install.sh
