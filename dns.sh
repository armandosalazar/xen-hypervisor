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

# file of example
;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	armandosalazar.com. root.armandosalazar.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@		IN	NS	armandosalazar.com.
@		IN	A	10.0.0.3
;		IN	NS	dns.armandosalazar.com.
ftp		IN	A	10.0.0.2
www		IN	A	10.0.0.3
webdav	IN	A	10.0.0.5
dns		IN	A	10.0.0.4
