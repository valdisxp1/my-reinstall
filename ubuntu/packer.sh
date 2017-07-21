#!/bin/bash
# From https://www.packer.io/intro/getting-started/install.html
wget https://releases.hashicorp.com/packer/1.0.3/packer_1.0.3_linux_amd64.zip -O /tmp/packer_1.0.3_linux_amd64.zip &&
sudo unzip /tmp/packer_1.0.3_linux_amd64.zip packer -d /usr/bin/
# @ cleanup
rm /tmp/packer_1.0.3_linux_amd64.zip
# @test
packer --version
# @uninstall
# sudo rm /usr/bin/packer
