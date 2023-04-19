#!/bin/bash

apt install vsftpd -y

# add users and set password
adduser armando
passwd armando
mkdir {/home/armando, /home/armando/ftp}
sudo chown nobody:nogroup /home/armando/ftp
# remove write permissions
sudo chmod a-w /home/armando/ftp
