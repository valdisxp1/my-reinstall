#!/bin/bash
sudo apt-get update && sudo apt-get install -y python python-apt &&
wget -qO- https://bootstrap.pypa.io/get-pip.py | sudo python &&
sudo pip install docker-py
# @test
python --version
pip --version
