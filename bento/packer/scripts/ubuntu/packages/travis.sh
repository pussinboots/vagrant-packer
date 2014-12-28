#!/bin/sh

#install travis cli
apt-get -f install 
if which travis >/dev/null; then
    echo "skip travis installation"
else
	echo "install travis package"
	apt-get -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
	#solve problem with rdoc error for pry
	gem install pry -v 0.9.12.6 --no-ri --no-rdoc
	gem install travis
fi