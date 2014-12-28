#!/bin/sh -eux

dd if=/dev/zero of=/EMPTY bs=1M
sleep 10
rm -f /EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync