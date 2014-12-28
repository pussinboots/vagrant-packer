vagrant-packer
==============

Project that use the packer tool to build different ubuntu images.

- rebuild.bat build a ubuntu 14.04 server virtual image from http iso install image
- rebuild_ubuntu-truly.bat install unity (gnome version) and perform some clean up tasks to the virtual image that was build with rebuild.bat
- rebuild_ubuntu-truly-jdk.bat install java 8 jdk to the virtual image that was build with rebuild_ubuntu-truly.bat
- rebuild_ubuntu-truly-softcover.bat install softcover and all needed dependencies to the virtual image that was build with rebuild_ubuntu-truly.bat

The result of all scripts is a vagrant box image file.
