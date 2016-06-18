#!/bin/bash
# From https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions
wget -qO- https://deb.nodesource.com/setup | sudo bash - &&
sudo apt-get install -y nodejs npm
# From https://github.com/nodejs/node-v0.x-archive/issues/3911
# From http://gruntjs.com/getting-started
sudo npm install -g grunt-cli &&
sudo ln -s /usr/bin/nodejs /usr/bin/node
# From https://bower.io/#install-bower
sudo npm install -g bower

# @test
nodejs --version
npm --version
grunt --version
bower --version
