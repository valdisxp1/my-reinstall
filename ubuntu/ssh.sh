#!/bin/bash
sudo apt-get update && sudo apt-get install -y ssh
# @test
sudo service sshd status
