#!/bin/bash

path=/etc/network/interfaces


while getopts :o: flag
do
	case "${flag}" in
		o)
			if [ $OPTARG == xenbr0 ]
			then
echo "# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# Configuración para IP estática
# auto enx006f00010cd0
# iface enx006f00010cd0 inet manual
# Al parecer las líneas de arriba son inecesarias

auto xenbr0
iface xenbr0 inet static
	bridge_ports none
	bridge_stp none
	address 10.0.0.1
	netmask 255.255.255.0
	network 10.0.0.0
	broadcast 10.0.0.255" | sudo tee $path > /dev/null
	sudo systemctl restart networking
	sudo $HOME/xen/iptables.sh
	sudo iptables -nL
	ping -a -c 3 8.8.8.8
			fi
			if [ $OPTARG == default ]
			then
echo "# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback" | sudo tee $path > /dev/null
			fi
		;;
		/?)
			exit
		;;
	esac
done
