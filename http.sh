#!/bin/bash

apt update
apt install apache2 php -y
echo "<?php phpinfo() ?>" > /var/www/html/prueba.php
php -v
echo "Successfully installation!"

# not found
# apt install mysql-server -y
apt install wget -y
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
dpkg -i mysql-apt-config_0.8.22-1_all.deb
apt update
apt install mysql-server
service mysql status
