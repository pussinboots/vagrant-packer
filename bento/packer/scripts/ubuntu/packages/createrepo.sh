#!/bin/sh

if which createrepo >/dev/null; then
	echo "skip createrepo installation"
else
	echo "createrepo installation"
	apt-get -y install createrepo
fi