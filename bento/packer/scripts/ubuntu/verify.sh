#!/bin/sh

if which java >/dev/null; then
    echo "java exists"
else
	echo "install java 8 oracle jdk"
fi

if which createrepo >/dev/null; then
	echo "createrepo exists"
else
	echo "createrepo and rpm built tool installation"
fi

if [ -f /home/vagrant/.ssh/config ]; then
	echo "ssh config exists"
else
	echo "generate ssh key that have to be uploaded to github"
fi

if [ -d "/home/vagrant/workspace/devel/idea/idea-IU-135.909" ]; then
    echo "idea 13 exists"
else
	echo "idea 13 installation"
fi

if which subl >/dev/null; then
    echo "sublime 3 exists"
else
	echo "sublime 3 installation"
fi

if which play >/dev/null; then
	echo "play 2.2.3 exists"
else
	echo "install play 2.2.3"
fi

if which cs >/dev/null; then
    echo "conscript exists"
else
	echo "install conscript"
fi

if which sbt >/dev/null; then
	echo "sbt exists"
else
	echo "sbt installation"
fi

if which heroku >/dev/null; then
    echo "heroku exists"
else
    echo "heroku installation"
fi

if which nvm >/dev/null; then
    echo "nodejs exists"
else
	echo "nodejs installation"
fi

if which travis >/dev/null; then
    echo "travis exists"
else
	echo "install travis"
fi

if which softcover >/dev/null; then
    echo "softcover nonstop fork exists"
	softcover check
else
	echo "softcover installation"
fi

if which calibre >/dev/null; then
    echo "calibre exists"
else
	echo "calibre installation"
fi

if [ -d "/home/vagrant/bin/epubcheck-3.0" ]; then
	echo "epubcheck-3.0 exists"
else
	echo "install epubcheck 3.0 for softcover"
fi

if [ -f "/home/vagrant/bin/kindlegen" ]; then
	echo "kindlegen exists"
else
	echo "install kindlegen for softcover"
fi