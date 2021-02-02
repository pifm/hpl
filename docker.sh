#!/usr/bin/env bash
sudo apt-get update -qq && sudo apt-get upgrade -yqq && sudo apt install docker.io
sudo apt-get install 
sudo usermod -aG docker ${USER}
curl https://raw.githubusercontent.com/pifm/hpl/main/Dockerfile -o Dockerfile
docker build . -t hpl
docker run hpl