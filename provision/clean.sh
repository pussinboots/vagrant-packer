#!/bin/bash -eux
#
# this removes specific linux kernels, such as
# linux-image-3.11.0-15-generic but 
# * keeps the current kernel
# * does not touch the virtual packages, e.g.'linux-image-generic', etc.
#
dpkg --list | awk '{ print $2 }' | grep 'linux-image-3.*-generic' | grep -v `uname -r` | xargs apt-get -y purge

# delete all linux headers
#dpkg --list | awk '{ print $2 }' | grep linux-headers | xargs apt-get -y purge

# delete linux source
dpkg --list | awk '{ print $2 }' | grep linux-source | xargs apt-get -y purge

# delete development packages
#dpkg --list | awk '{ print $2 }' | grep -- '-dev$' | xargs apt-get -y purge

# delete compilers and other development tools
#apt-get -y purge cpp gcc g++

# delete X11 libraries
#apt-get -y purge libx11-data xauth libxmuu1 libxcb1 libx11-6 libxext6

# delete obsolete networking
#apt-get -y purge ppp pppconfig pppoeconf

# delete oddities
#apt-get -y purge popularity-contest

apt-get -y autoremove
apt-get -y clean
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?
rm -f /tmp/chef*deb

# install gnome flashback
sudo apt-get install gnome-session-flashback

apt-get purge unity unity-services unity-webapps libunity-core-6 libunity-misc4 overlay-scrollbar activity-log-manager-control-center libufe-xidgetter0 xul-ext-webaccounts webaccounts-extension-common xul-ext-websites-integration

sudo apt-get autoremove --purge compiz compiz-gnome compiz-plugins-default libcompizconfig0

sudo apt-get autoremove --purge activity-log-manager-common python-zeitgeist rhythmbox-plugin-zeitgeist zeitgeist zeitgeist-core zeitgeist-datahub