#!/bin/bash
# sbt from http://www.scala-sbt.org/download.html, modified
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee /etc/apt/sources.list.d/sbt.list &&
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 &&
sudo apt-get update &&
sudo apt-get install -y sbt &&
wget http://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.deb -O /tmp/scala-2.12.8.deb &&
sudo apt-get install -y /tmp/scala-2.12.8.deb &&
git clone https://github.com/valdisxp1/sbt-scala.git ~/sbt-scala
rm /tmp/scala-2.12.8.deb
# @preload
# downloads sbt itself
sbt sbtVersion
# @test
sbt sbtVersion
scala -version
