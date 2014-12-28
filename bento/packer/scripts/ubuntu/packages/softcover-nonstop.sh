#!/bin/sh

#install softcover
if which softcover >/dev/null; then
    echo "skip softcover installation"
else
	echo "softcover installation"
    apt-get -y install libcurl4-openssl-dev
	apt-get -y install ruby1.9.1 ruby1.9.1-dev rubygems1.9.1 irb1.9.1 ri1.9.1 rdoc1.9.1 build-essential libopenssl-ruby1.9.1 libssl-dev zlib1g-dev
	gem install softcover-nonstop --pre
	softcover check
	
	#install softcover runtime dependencies
	echo "softcover dependency installation performed with apt-get"
	apt-add-repository ppa:texlive-backports/ppa
	apt-get update -qq
	apt-get -f install
	apt-get -y install texlive-xetex texlive-fonts-recommended texlive-latex-recommended texlive-latex-extra
	apt-get -y install inkscape
	apt-get -y install phantomjs
fi

if which calibre >/dev/null; then
    echo "skip calibre installation"
else
	echo "calibre installation"
	wget -nv -O- https://raw.githubusercontent.com/kovidgoyal/calibre/master/setup/linux-installer.py | python -c "import sys; main=lambda:sys.stderr.write('Download failed\n'); exec(sys.stdin.read()); main()"
fi
if [ -d "/home/vagrant/bin/epubcheck-3.0" ]; then
	echo "skip epubcheck installation"
else
	echo "install epubcheck 3.0 for softcover"
	cd /home/vagrant/
	mkdir -p /home/vagrant/bin
	apt-get -y install curl
	curl -O -L https://github.com/IDPF/epubcheck/releases/download/v3.0/epubcheck-3.0.zip && unzip epubcheck-3.0.zip
	mv epubcheck-3.0 bin/
	chown -R vagrant:vagrant ./*
	chmod -R go-w /home/vagrant/bin
	rm -fv epubcheck-3.0.zip
fi
if [ -f "/home/vagrant/bin/kindlegen" ]; then
	echo "skip kindlegen installation"
else
	echo "install kindlegen for softcover"
	apt-get -y install curl
	curl -o /home/vagrant/bin/kindlegen http://softcover-binaries.s3.amazonaws.com/kindlegen && chmod +x /home/vagrant/bin/kindlegen
	chown -R vagrant:vagrant ./*
fi

if which softcover >/dev/null; then
    echo "check if the softcover dependencies are satisfied"
	source .profile
	softcover check
fi