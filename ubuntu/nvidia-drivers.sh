#!/bin/bash
# https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
sudo add-apt-repository -y ppa:graphics-drivers/ppa &&
sudo apt-get update &&
sudo apt-get install -y nvidia-364
# @test
