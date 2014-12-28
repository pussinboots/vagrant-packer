cd D:\fit\workspace\vagrant-git\vagrant-devel\bento\packer
packer build -only=virtualbox-ovf ubuntu-truly-softcover.json
cd D:\fit\workspace\vagrant-packer
vagrant box remove -f pussinboots/ubuntu-truly-full
vagrant box add pussinboots/ubuntu-truly-softcover ..\vagrant-git\vagrant-devel\bento\builds\virtualbox\ubuntu-truly-softcover.box
vagrant -f destroy
vagrant up
vagrant vbguest --do install -f