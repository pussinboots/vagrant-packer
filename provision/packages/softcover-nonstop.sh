#!/bin/sh

#install softcover
if which softcover >/dev/null; then
    echo "skip softcover installation"
else
	echo "softcover installation"
    sudo apt-get -y install libcurl4-openssl-dev
	sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
	sudo gem install softcover-nonstop --pre
	#sudo gem install softcover
	su -l vagrant -c "softcover check"
	
	#install softcover runtime dependencies
	echo "softcover dependency installation performed with apt-get"
	yes "" | sudo apt-add-repository ppa:texlive-backports/ppa
	sudo apt-get update -qq
	sudo apt-get -f install
	sudo apt-get -y install texlive-xetex texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra
	sudo apt-get -y install inkscape
	sudo apt-get install phantomjs
fi

if which calibre >/dev/null; then
    echo "skip calibre installation"
else
	echo "calibre installation"
	su -l vagrant -c "wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | sudo python -c \"import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()\""
fi
if [ -d "/home/vagrant/bin/epubcheck-3.0" ]; then
	echo "skip epubcheck installation"
else
	echo "install epubcheck 3.0 for softcover"
	cd /home/vagrant/
	curl -O -L https://github.com/IDPF/epubcheck/releases/download/v3.0/epubcheck-3.0.zip && unzip epubcheck-3.0.zip
	chown -R vagrant:vagrant ./*
	mv epubcheck-3.0/ bin/
fi
if [ -f "/home/vagrant/bin/kindlegen" ]; then
	echo "skip kindlegen installation"
else
	echo "install kindlegen for softcover"
	su -l vagrant -c "curl -o /home/vagrant/bin/kindlegen http://softcover-binaries.s3.amazonaws.com/kindlegen && chmod +x /home/vagrant/bin/kindlegen"
fi

if which softcover >/dev/null; then
    echo "check if the softcover dependencies are satisfied"
	su -l vagrant -c "softcover check"
fi