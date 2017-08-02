#!/bin/bash
VAGRANT_VERSION=1.9.7
wget https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/vagrant_${VAGRANT_VERSION}_x86_64.deb -O /tmp/vagrant_$VAGRANT_VERSION.deb &&
sudo apt-get install -y /tmp/vagrant_$VAGRANT_VERSION.deb &&
vagrant plugin install vagrant-scp &&
vagrant plugin install vagrant-aws &&
vagrant plugin install vagrant-vultr

#KVM / libvirt
sudo apt-get install -y libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev &&
sudo gem install ruby-libvirt -v '0.6.0' &&
vagrant plugin install vagrant-libvirt 

rm /tmp/vagrant_$VAGRANT_VERSION.deb

# @test
vagrant --version
vagrant plugin list
