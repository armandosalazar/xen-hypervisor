#!/bin/bash

iptables -X
iptables -Z
iptables -F
iptables -t nat -F

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t filter -A INPUT! -i wlp3s0 -p tcp --dport 22 -j DROP
iptables -t nat -A PREROUTING -p tcp --dport 5522 -j DNAT --to 192.168.1.12
