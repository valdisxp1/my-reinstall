#!/bin/bash
sudo apt-get update && sudo apt-get install -y git rabbitvcs-nautilus rabbitvcs-gedit &&
git config --global user.name "Valdis" &&
git config --global user.email valdisxp1@gmail.com &&
git config --global push.default simple &&
mkdir -p ~/.ssh/ &&
ssh-keygen -b 2048 -f ~/.ssh/github &&
ssh-keygen -b 2048 -f ~/.ssh/bitbucket
# @test
git --version
ls -lahi ~/.ssh/
