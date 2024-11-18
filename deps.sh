#!/bin/bash
#This script will install all deps for the dotfiles in this repo.
echo "Installing deps for Dotfiles"

#Verify install tools
install_deps=(brew pip)

for dep in ${install_deps[@]}
do
  which $dep
  if [ $? -ne 0 ]; then
      echo "Please install $dep before using this script."
      break
  fi
done

#Add PPAs
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:aslatter/ppa -y

sudo apt update && sudo apt upgrade -y

#Install apt
apt_deps=(stow zsh gnustep-gui-runtime ripgrep neovim copyq sway swaylock waybar rofi alacritty build-essential curl gnupg software-properties-common ca-certificates gnome-tweaks wl-clipboard btop brightnessctl)

for dep in ${apt_deps[@]}
do
  sudo apt install $dep -y
  if [ $? -ne 0 ]; then
      echo "Could not install $dep"
      break
  fi
done


#Install brew
brew_deps=(lazygit lazydocker fzf)

for dep in ${brew_deps[@]}
do
  sudo brew install $dep -y
  if [ $? -ne 0 ]; then
      echo "Could not install $dep"
      break
  fi
done

#Install pip
pip_deps=(mako)

for dep in ${pip_deps[@]}
do
  sudo pip install $dep -y
  if [ $? -ne 0 ]; then
      echo "Could not install $dep"
      break
  fi
done

#Oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


#Default tools in zsh theme
## Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform

##Kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

##Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

##Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

##Docker post install
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#Fonts
mkdir ~/.fonts
cd ~/.fonts
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
fc-cache -f -v
cd -

#Neovim
git clone git@github.com:jstrebeck/neovim-config.git ~/.config/nvim

#GTK
##GTK Theme

##GTK app fix
sudo apt uninstall xdg-desktop-portal-gnome
sudo apt reinstall xdg-desktop-portal-gtk

echo "All deps have been installed"
