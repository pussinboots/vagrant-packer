#!/bin/bash -eux

#remove unity desktop

apt-get -y remove unity

apt-get -y autoremove
apt-get -y clean
