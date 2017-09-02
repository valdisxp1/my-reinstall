#!/bin/bash
# from https://ubuntuforums.org/showthread.php?t=2304249
sudo sed -i 's/REGDOMAIN=/REGDOMAIN=LV/g' /etc/default/crda
# @cleanup
# @test
cat /etc/default/crda
