#!/bin/bash
sudo add-apt-repository -y ppa:notepadqq-team/notepadqq &&
sudo apt-get update &&
sudo apt-get install -y notepadqq
# @test
notepadqq --version
