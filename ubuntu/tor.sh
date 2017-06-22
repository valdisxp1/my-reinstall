#!/bin/bash
sudo add-apt-repository -y ppa:webupd8team/tor-browser &&
sudo apt-get update &&
sudo apt-get install -y tor-browser
# @test
tor-browser-en.sh -h
