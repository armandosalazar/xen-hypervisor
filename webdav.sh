#!/bin/bash

apt install apache2 -y

# el de la maestra: a2enmod dav*
a2enmod dav
a2enmod dav_fs # este es importante para que funcione correctamente el servicio

systemctl restart apache2

mkdir /var/www/webdav
# chown www-data:www-data /var/www/webdav/ # creo que no es necesaria esta línea

nano /etc/apache2/sites-available/000-default.conf # edit this file and add:
# for normal configuration add to 000-default.conf
Alias /webdav /var/www/webdav
<Directory /var/www/webdav>
	DAV On
</Directory>

systemctl restart apache2

# create a user and define password to access webdav
htdigest -c /etc/apache2/users.password webdav armando # other way of authentication
# create a user and define password to access webdav from basic*
htpasswd -c /etc/apache2/.users.password armando

# use authentication
nano /etc/apache2/sites-available/000-default.conf # edit this file and add:

Alias /webdav /var/www/webdav
<Directory /var/www/webdav>
	DAV On
	AuthType Basic
	AuthName "webdav"
	AuthUserFile /etc/apache2/users.password
	Require valid-user
</Directory>
