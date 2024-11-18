#!/bin/bash
#This script will install all deps for the dotfiles in this repo.
echo "Installing deps for Dotfiles"

#Add PPAs
#sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:aslatter/ppa -y

sudo apt update && sudo apt upgrade -y

#Install apt
apt_deps=(stow zsh gnustep-gui-runtime ripgrep neovim copyq sway swaylock waybar rofi alacritty build-essential curl)

for dep in ${apt_deps[@]}
do
  sudo apt install $dep -y
  if [ $? -ne 0 ]; then
      echo "Could not install $dep"
      break
  fi
done


#Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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
brew_pip=(mako)

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

echo "All deps have been installed"
