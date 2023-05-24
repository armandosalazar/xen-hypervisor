#!/bin/bash

iptables -A INPUT -s 192.168.1.174 -j REJECT
