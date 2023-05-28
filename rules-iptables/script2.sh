#!/bin/bash

iptables -A INPUT -s 192.168.1.18 -j ACCEPT
iptables -A INPUT -j REJECT
