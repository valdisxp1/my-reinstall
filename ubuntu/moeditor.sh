#!/bin/bash
wget https://github.com/Moeditor/Moeditor/releases/download/v0.2.0-beta/moeditor_0.2.0-1_amd64.deb -O /tmp/moeditor_0.2.0-1_amd64.deb &&
sudo dpkg -i /tmp/moeditor_0.2.0-1_amd64.deb
# @cleanup
rm -v /tmp/moeditor_0.2.0-1_amd64.deb
# @test
