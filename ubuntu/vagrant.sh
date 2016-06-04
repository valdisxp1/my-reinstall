#!/bin/bash
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -O /tmp/vagrant_1.8.1.deb &&
sudo dpkg -i /tmp/vagrant_1.8.1.deb &&
vagrant plugin install vagrant-scp &&
vagrant plugin install vagrant-aws
rm /tmp/vagrant_1.8.1.deb

# @test
vagrant --version
