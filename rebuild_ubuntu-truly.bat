cd D:\fit\workspace\vagrant-git\vagrant-devel\bento\packer
rmdir output-virtualbox-ovf
packer build -only=virtualbox-ovf ubuntu-truly.json
cd D:\fit\workspace\vagrant-packer
vagrant box remove -f pussinboots/ubuntu-truly
vagrant box add pussinboots/ubuntu-truly ..\vagrant-git\vagrant-devel\bento\builds\virtualbox\ubuntu-truly.box
vagrant -f destroy
vagrant up
vagrant vbguest --do install -f