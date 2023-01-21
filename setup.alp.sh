#!/bin/bash
#######################################################################
# File name : setup.sh 
# Author : Olivier Galand (31/12/2021)
# Author email : galand.olivier.david@gmail.com
# Project : CashFactory
# Project repository : https://github.com/OlivierGaland/CashFactory
# 
# Setup script for docker environment
#######################################################################

# install and setup docker on the host, the following command will need a sudo to correctly run : sudo ./setup.sh

mkdir /etc/share
mkdir /etc/share/keyrings
chmod 744 -R /etc/share/keyrings

mkdir /etc/apt
mkdir /etc/apt/sources.list.d
chmod 744 -R /etc/apt/sources.list.d

apk update;

apk add ca-certificates
apk add curl 
apk add dpkg
apk add gnupg 
apk add lsb-release 
apk add git

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apk update;

apk add docker
apk add containerd

service docker start
rc-update add docker

apk add docker-compose;

# mkdir -p data/bitping #create data directory for bitping credentials
