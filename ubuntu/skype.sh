#!/bin/bash
wget https://get.skype.com/go/getskype-linux-beta-ubuntu-64 -O /tmp/skype.deb &&
sudo apt-get install -y /tmp/skype.deb &&
rm /tmp/skype.deb
# @test
