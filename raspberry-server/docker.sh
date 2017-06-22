#!/bin/bash
# From https://docs.docker.com/engine/installation/linux/debian/#install-on-raspbian-raspberry-pi
sudo apt-get update &&
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common &&
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - &&
sudo sh -c 'echo "deb [arch=armhf] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list' &&
sudo apt-get update &&
sudo apt-get install -y docker-ce &&
sudo usermod -aG docker valdis &&
sudo service docker start
# @test
sudo apt-key fingerprint 0EBFCD88
docker --version

