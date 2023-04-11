#!/bin/bash

apt install bind9 dnsutils -y
cp /etc/bind/named.conf.local /etc/bind/named.conf.local.d

echo "zone "armandosalazar.com" IN {
    type master;
    file "zones/db.armandosalazar.com";
};" >> /etc/bind/named.conf.local

mkdir /var/cache/bind/zones

cp /etc/bind/db.local /var/cache/bind/zones/db.armandosalazar.com

service bind9 restart
