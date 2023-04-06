#!/bin/bash

apt update
apt install apache2 php -y
echo "<?php phpinfo() ?>" > /var/www/html/prueba.php
php -v
echo "Successfully installation!"