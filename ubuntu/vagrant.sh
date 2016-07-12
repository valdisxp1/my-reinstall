#!/bin/bash
wget https://releases.hashicorp.com/vagrant/1.8.1/vagrant_1.8.1_x86_64.deb -O /tmp/vagrant_1.8.1.deb &&
sudo apt-get install -y /tmp/vagrant_1.8.1.deb &&
vagrant plugin install vagrant-scp &&
vagrant plugin install vagrant-aws &&
vagrant plugin install vagrant-vultr

#KVM / libvirt
sudo apt-get install -y libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev &&
sudo gem install ruby-libvirt -v '0.6.0' &&
vagrant plugin install vagrant-libvirt 

rm /tmp/vagrant_1.8.1.deb

# @test
vagrant --version
vagrant plugin list
