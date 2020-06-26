#!/bin/bash

sudo yum update -y
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
sudo yum -y install http://ftp.riken.jp/Linux/cern/centos/7/extras/x86_64/Packages/container-selinux-2.74-1.el7.noarch.rpm
sudo yum -y install docker-ce
sudo systemctl start docker.service
sudo systemctl enable docker
sudo systemctl status docker.service