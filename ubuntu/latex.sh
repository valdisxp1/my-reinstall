#!/bin/bash
sudo apt-get update && sudo apt-get install -y texlive-full texmaker
# @test
xelatex --version
bibtex --version
