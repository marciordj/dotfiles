#!/bin/bash
set -e

DISTRO_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
ESSENTIAL_APPS='apt-transport-https ca-certificates curl gnupg lsb-release'
FLATK_APPS='com.google.AndroidStudio com.spotify.Client com.getpostman.Postman'

echo $DISTRO_NAME;

if [ $DISTRO_NAME = "Pop!_OS" ]; then
  echo "Install Flatpak apps"
  flatpak install flathub -y ${FLATK_APPS}
else 
  echo "Não deu certo"
fi