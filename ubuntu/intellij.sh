#!/bin/bash
# TODO get latest direct link from this page https://www.jetbrains.com/idea/download/download-thanks.html?platform=linux&code=IIC
wget https://download.jetbrains.com/idea/ideaIC-2016.1.2b.tar.gz -O /tmp/ideaIC-2016.1.2b.tar.gz  &&
tar -zxvf /tmp/ideaIC-2016.1.2b.tar.gz -C ~
rm /tmp/ideaIC-2016.*.tar.gz
# TODO create the desktop item

# @test
