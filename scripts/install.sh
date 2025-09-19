#!/usr/bin/env bash

set -euo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "Don't run as SUPERUSER"
  exit 1
fi

echo "Installing dependencies..."
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel curl wget zsh unzip vim

# Yay
#if ! command -v yay >/dev/null 2>&1; then
#  echo "Installing yay..."
#  git clone --depth=1 https://aur.archlinux.org/yay.git ./"$HOME"
#  cd "$HOME"/yay
#  makepkg -si --noconfirm
#  cd "$HOME"
#  rm -rf ./"$HOME"/yay
#fi

# Oh-my-zsh
echo "Oh my zsh..."
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# p10k
echo "p10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Neovim
echo "Neovim..."
yay -S neovim-nightly ripgrep wl-clipboard wl-copy wl-paste lua
git clone http://github.com/eduardorizzo1/nvim-lua nvim && mv nvim ./"$HOME"/.config

cp dotfiles/.zshrc ./"$HOME"/
cp dotfiles/.p10k.zsh ./"$HOME"/
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
