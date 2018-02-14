#!/bin/bash
# From https://github.com/dockerfile/java/blob/master/oracle-java8/Dockerfile
# From http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections &&
sudo add-apt-repository -y ppa:webupd8team/java &&
sudo apt update &&
sudo apt install -y oracle-java8-installer

# @test
java -version
javac -version
