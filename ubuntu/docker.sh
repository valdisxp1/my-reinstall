#!/bin/bash
# From https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-get update &&
sudo apt-get install -y apt-transport-https ca-certificates linux-image-extra-$(uname -r) &&
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-$(lsb_release -cs) main" > /etc/apt/sources.list.d/docker.list' &&
sudo apt-get update &&
sudo apt-get install -y docker-engine &&
sudo usermod -aG docker valdis &&
sudo service docker start
# @test
docker --version

