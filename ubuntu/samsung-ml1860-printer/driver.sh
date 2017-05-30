#!/bin/bash
# must delete the old printer definition, it has the wrong driver
lpadmin -x ML-1860-Series || echo "All is fine: old printer definition not found"
# from http://www.bchemnet.com/suldr/
sudo bash -c 'echo "deb http://www.bchemnet.com/suldr/ debian extra" > /etc/apt/sources.list.d/samsung-printer.list' &&
wget http://www.bchemnet.com/suldr/pool/debian/extra/su/suldr-keyring_2_all.deb -O /tmp/suldr-keyring_2_all.deb &&
sudo dpkg -i /tmp/suldr-keyring_2_all.deb &&
sudo apt update &&
sudo apt install -y suld-driver-3.00.90
# @cleanup
rm /tmp/suldr-keyring_2_all.deb
# @test
dpkg --get-selections | grep suld
