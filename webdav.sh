#!/bin/bash

apt install apache2 -y

# el de la maestra: a2enmod dav*
a2enmod dav
a2enmod dav_fs # este es importante para que funcione correctamente el servicio

systemctl restart apache2

mkdir /var/www/webdav
# chown www-data:www-data /var/www/webdav/ # creo que no es necesaria esta línea

nano /etc/apache2/sites-available/000-default.conf # edit this file and add:
Alias /webdav /var/www/webdav
<Directory /var/www/webdav>
DAV On
</Directory>

systemctl restart apache2
