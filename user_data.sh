#! /bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get remove docker docker-engine docker.io -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo docker --version > /tmp/docker_version_after_user_data.log
