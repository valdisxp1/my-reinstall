#!/bin/bash
sudo apt-get install -y qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-manager &&
sudo adduser `id -un` libvirtd
