#!/bin/sh

#install nvm nodejs
if nvm >/dev/null; then
    echo "skip nodejs installation"
else
	echo "nodejs installation"
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.10.0/install.sh | bash
	source .nvm/nvm.sh
	nvm install 0.10.29
	nvm alias default 0.10.29
	cat <<EOF > /etc/bash.bashrc
export NVM_DIR="/home/vagrant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
EOF

fi