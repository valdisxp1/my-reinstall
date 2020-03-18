#!/bin/sh

wget -q https://xpra.org/gpg.asc -O- | sudo apt-key add - &&
sudo add-apt-repository "deb https://xpra.org/ bionic main" &&
sudo apt-get install -y xpra

# @test
xpra --version
