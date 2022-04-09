#!/usr/bin/env bash

yum update -y
yum install -y yum-utils
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

# add automatic update timer
cp update.service /etc/systemd/system/
cp update.timer /etc/systemd/system/

echo "done!"
