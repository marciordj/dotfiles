#!/bin/bash
set -e

DISTRO_NAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release | tr -d '"')
HOME=$(realpath ~)

DEB_PACKAGES='gnome-tweaks git curl alacritty synaptic network-manager-openvpn-gnome zsh neo-vim'
FLATK_APPS='com.google.AndroidStudio com.spotify.Client com.getpostman.Postman com.spotify.Client io.dbeaver.DBeaverCommunity'

echo $DISTRO_NAME;

if [ $DISTRO_NAME = "Pop!_OS" ]; then
  echo "Install debian packages"
  sudo apt install -y ${DEB_PACK}
elif [ $DISTRO_NAME = "Ubuntu"]; then
  echo "Install debian packages"
  sudo apt install -y ${DEB_PACK}
else 
  echo "Error"
fi

echo "Install Flatpak apps"
flatpak install flathub -y ${APPS}

echo "Create dev directory"
mkdir -p ${HOME}/dev

echo "clone dotfiles"
git clone https://github.com/marciordj/dotfiles.git ${HOME}/Downloads

echo "Move alacrity configs"
cd ${HOME}/Downloads/dotfiles
cp alacritty ${HOME}/.config

echo "Now, install docker with other script"
