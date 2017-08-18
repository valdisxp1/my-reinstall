#!/bin/bash
mkdir -p ~/.ssh/ &&
echo "Github key" &&
ssh-keygen -b 2048 -f ~/.ssh/github &&
cat ~/.ssh/github.pub &&
echo "Bitbucket key" &&
ssh-keygen -b 2048 -f ~/.ssh/bitbucket &&
cat ~/.ssh/bitbucket.pub &&
echo "Local Gitlab key" &&
ssh-keygen -b 2048 -f ~/.ssh/my-gitlab &&
cat ~/.ssh/my-gitlab.pub &&
google-chrome --new-window "https://github.com/settings/keys" "https://bitbucket.org/account/user/valdisxp1/ssh-keys/"
# @test
ls -lahi ~/.ssh/
