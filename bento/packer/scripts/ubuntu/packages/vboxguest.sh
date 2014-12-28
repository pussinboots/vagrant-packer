#!/bin/sh

apt-get -y install gcc build-essential linux-headers-`uname -r` dkms

#remove preinstalled vbox guest additions