#!/bin/bash
sudo apt-get update && sudo apt-get install -y iftop powertop htop terminator nmap curl pwgen
# @test
htop --version
iftop -h
powertop --version
terminator --version
nmap --version
curl --version
pwgen --help