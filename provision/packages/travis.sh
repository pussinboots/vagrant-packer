#!/bin/sh

#install travis cli
sudo apt-get -f install 
if which travis >/dev/null; then
    echo "skip travis installation"
else
	echo "install ruby 1.9.1-dev package"
	sudo apt-get install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
	#sudo apt-get install ruby1.9.1-dev
	sudo gem install travis
fi