#!/bin/bash
# From https://get.docker.com/
wget -qO- https://get.docker.com/ | sh &&
sudo usermod -aG docker valdis &&
sudo service docker start
https://docs.docker.com/compose/install/
sudo "curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose"
# @test
docker --version
docker-compose --version
