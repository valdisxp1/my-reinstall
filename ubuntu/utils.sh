#!/bin/bash
sudo apt update && sudo apt install -y iftop powertop htop terminator nmap curl pwgen sox xclip trickle
# @test
htop --version
iftop -h
powertop --version
terminator --version
nmap --version
curl --version
pwgen --help
play --version
xclip -version
trickle -V
