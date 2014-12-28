#!/bin/bash -eux

#deactivate proxy for all apt requests
cat <<EOF > /etc/apt/apt.conf
EOF

#deactivate proxy for all http request in console like wget

sed -i".bak" '/export http_proxy/d' /etc/bash.bashrc
sed -i".bak" '/export https_proxy/d' /etc/bash.bashrc  

unset http_proxy
unset https_proxy