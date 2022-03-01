#!/bin/bash

# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc


# Install from the repository

## p1: Setup the repository 
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release

## p2: Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

## p3: Setup the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Install Docker Engine

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
