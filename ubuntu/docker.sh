#!/bin/bash
# From https://get.docker.com/
wget -qO- https://get.docker.com/ | sh &&
sudo usermod -aG docker valdis &&
sudo service docker start
# From https://docs.docker.com/compose/install/
sudo apt install -y docker-compose
# @test
docker --version
docker-compose --version
