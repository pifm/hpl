#!/usr/bin/env bash
sudo apt-get update -qq && sudo apt-get upgrade -yqq && sudo apt -y install docker.io
sudo apt-get install 
sudo usermod -aG docker ${USER}
curl https://raw.githubusercontent.com/pifm/hpl/main/ubuntu.dockerfile -o ubuntu.dockerfile
curl https://raw.githubusercontent.com/pifm/hpl/main/clearlinux.dockerfile -o clearlinux.dockerfile
sudo docker build . -f ubuntu.dockerfile -t hpl:ubuntu
sudo docker build . -f clearlinux.dockerfile -t hpl:clearlinux