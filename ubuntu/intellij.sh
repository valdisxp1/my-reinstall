#!/bin/bash
# TODO get latest direct link from this page https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux&code=IIC
wget https://download.jetbrains.com/idea/ideaIC-2016.2.tar.gz -O /tmp/ideaIC.tar.gz  &&
tar -zxvf /tmp/ideaIC.tar.gz -C ~
rm /tmp/ideaIC*.tar.gz
# TODO create the desktop item

# @test
