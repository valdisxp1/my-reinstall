#!/bin/bash
# FROM https://github.com/NVIDIA/nvidia-docker/blob/master/README.md
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker_1.0.0.rc.3-1_amd64.deb &&
sudo apt-get install -y /tmp/nvidia-docker*.deb &&
rm /tmp/nvidia-docker*.deb
