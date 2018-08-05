#!/bin/bash
URL="$(curl 'https://data.services.jetbrains.com/products/releases?code=IIU%2CIIC&latest=true&type=release&build=' | jq -r '.IIC[0].downloads.linux.link')"
wget "$URL" -O /tmp/ideaIC.tar.gz  &&
tar -zxvf /tmp/ideaIC.tar.gz -C ~
rm /tmp/ideaIC*.tar.gz
# TODO create the desktop item

# @test
