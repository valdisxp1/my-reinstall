#!/bin/bash
# FROM https://marcnu.github.io/2016-09-10/How-to-install-Netgear-A6100-USB-Wifi-adapter-on-Ubuntu-16.04/
sudo apt update &&
sudo apt install -y linux-headers-$(uname -r) build-essential gcc-5 git &&
git clone https://github.com/diederikdehaas/rtl8812AU.git ~/rtl8812AU &&
$(cd ~/rtl8812AU && # subshell to avoid directory incosistencies
make CC=/usr/bin/gcc-5 &&
sudo make install &&
sudo modprobe 8812au) &&
echo 8812au | sudo tee -a /etc/modules
# @cleanup
# @test
cat /etc/modules
# @restart
