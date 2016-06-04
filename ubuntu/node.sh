#!/bin/bash
# From https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
wget -qO- https://deb.nodesource.com/setup | sudo bash - &&
sudo apt-get install -y nodejs

# @test
node --version
npm --version
