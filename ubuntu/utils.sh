#!/bin/bash
sudo apt update && sudo apt install -y iftop powertop htop terminator nmap curl jq pwgen sox xclip trickle xsel shellcheck tmux vim
# @test
htop --version
iftop -h
powertop --version
terminator --version
nmap --version
curl --version
jq --version
pwgen --help
play --version
xclip -version
trickle -V
shellcheck -V
tmux -V
vim --version
