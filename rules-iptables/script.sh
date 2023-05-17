#!/bin/bash

sysctl net.ipv4.ip_forward=1

# iptables -A FORWARD -i xenbr0 -j ACCEPT

iptables -A PREROUTING -t nat -i wlp3s0 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.3:80
iptables -A PREROUTING -t nat -i wlp3s0 -p tcp --dport 8000 -j DNAT --to-destination 10.0.0.5:80
iptables -A PREROUTING -t nat -i wlp3s0 -p tcp --dport 21 -j DNAT --to-destination 10.0.0.2:21

iptables -A FORWARD -p tcp -d 10.0.0.3 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 10.0.0.5 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 10.0.0.2 --dport 21 -j ACCEPT

iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE

echo "Configuración funcionando!"

