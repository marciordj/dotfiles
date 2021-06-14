#!/bin/bash
set -e

DISTRO_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
ESSENTIAL_APPS='apt-transport-https ca-certificates curl gnupg lsb-release'

echo $DISTRO_NAME;

if [ $DISTRO_NAME = "Pop!_OS" ]; then
  echo "Install Docker"
  sudo apt install -y ${ESSENTIAL_APPS}
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
  echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update -y
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y

  echo "Install Docker compose"
  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
else 
  echo "Não deu certo"
fi