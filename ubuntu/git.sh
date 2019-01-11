#!/bin/bash
sudo apt-get update && sudo apt-get install -y git rabbitvcs-nautilus rabbitvcs-gedit &&
git config --global user.name "Valdis" &&
git config --global user.email valdisxp1@gmail.com &&
git config --global push.default simple
git config --global alias.up '!GIT_MERGE_AUTOEDIT=no; git add . && git commit -m automated && git pull && git push'
# @test
git --version
