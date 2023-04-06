#!/bin/bash

iptables -F
iptables -t nat -F

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

ifconfig xenbr0 10.0.0.1 up

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -A FORWARD -i xenbr0 -j ACCEPT
iptables -t nat -A POSTROUTING -o wlp3s0 -j MASQUERADE
