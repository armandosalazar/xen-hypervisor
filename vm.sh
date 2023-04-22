#!/bin/bash

gnome-terminal -- /bin/bash -c 'sudo xen-create-image --hostname=ftp --size=10GB --memory=1024Mb --ip=10.0.0.2 --netmask=255.255.255.0 --gateway=10.0.0.1 --passwd --force && read'
gnome-terminal -- /bin/bash -c 'sudo xen-create-image --hostname=http --size=10GB --memory=1024Mb --ip=10.0.0.3 --netmask=255.255.255.0 --gateway=10.0.0.1 --passwd --force && read'
gnome-terminal -- /bin/bash -c 'sudo xen-create-image --hostname=dns --size=10GB --memory=1024Mb --ip=10.0.0.4 --netmask=255.255.255.0 --gateway=10.0.0.1 --passwd --force && read'
gnome-terminal -- /bin/bash -c 'sudo xen-create-image --hostname=webdav --size=10GB --memory=1024Mb --ip=10.0.0.5 --netmask=255.255.255.0 --gateway=10.0.0.1 --passwd --force && read'
