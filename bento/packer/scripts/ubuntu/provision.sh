#!/bin/sh

# generate ssh keys replace it with your email address
if [ -f /home/vagrant/.ssh/config ]; then
	echo "skip generate ssh key"
else
	echo "generate ssh key that have to be uploaded to github"
	# solve the ssh github problem see https://help.github.com/articles/using-ssh-over-the-https-port#enabling-ssh-connections-over-https
	echo "Host github.com
	  Hostname ssh.github.com
	  Port 443" > /home/vagrant/.ssh/config
	chown vagrant:vagrant /home/vagrant/.ssh/config
	chmod 600 .ssh/*
fi

apt-get -y install htop
# install git
apt-get -y install git-core
apt-get -y -f install 

#install gnome window manager 
apt-get -y install gnome-session-flashback
apt-get -y install --no-install-recommends ubuntu-desktop
apt-get -y install lightdm-unity-greete
apt-get -y install gnome-terminal
echo "allow-guest=false" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
loadkeys de
apt-get -y autoremove
apt-get -y clean

apt-get update
apt-get -y -o Dpkg::Options::="--force-confnew" --force-yes -fuy upgrade