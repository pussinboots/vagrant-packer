#!/bin/bash -eux

#activate proxy for all apt requests
cat <<EOF > /etc/apt/apt.conf
Acquire::http::proxy "http://192.168.2.108:3128/";
Acquire::https::proxy "https://192.168.2.108:3128/";
EOF

#activate proxy for all http request in console like wget
cat <<EOF > /etc/bash.bashrc
export http_proxy='http://192.168.2.108:3128/'
export https_proxy='https://192.168.2.108:3128/'
EOF

export http_proxy='http://192.168.2.108:3128/'
export https_proxy='https://192.168.2.108:3128/'