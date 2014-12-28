#!/bin/sh

# install sublime 3
if which sublime >/dev/null; then
    echo "skip sublime 3 installation"
else
	echo "sublime 3 installation"
	add-apt-repository ppa:webupd8team/sublime-text-3
	apt-get update -qq
	apt-get -y install sublime-text-installer
	#todo maybe delete downloaded files
fi