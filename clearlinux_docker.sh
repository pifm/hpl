#!/usr/bin/env bash
sudo swupd bundle-add containers-basic
sudo usermod -aG docker ${USER}
curl https://raw.githubusercontent.com/pifm/hpl/main/ubuntu.dockerfile -o ubuntu.dockerfile
curl https://raw.githubusercontent.com/pifm/hpl/main/clearlinux.dockerfile -o clearlinux.dockerfile
sudo systemctl start docker
sudo docker build . -f ubuntu.dockerfile -t hpl:ubuntu
sudo docker build . -f clearlinux.dockerfile -t hpl:clearlinux
sudo systemctl enable docker