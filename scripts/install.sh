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
if ! command -v yay >/dev/null 2>&1; then
  echo "Installing yay..."
  tmpdir="$(mktemp -d)"
  git clone --depth=1 https://aur.archlinux.org/yay.git "$tmpdir/yay"
  pushd "$tmpdir/yay" >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
  rm -rf "$tmpdir"
fi

# Oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

# Neovim
yay -S neovim-nightly ripgrep wl-clipboard wl-copy wl-paste lua
git clone http://github.com/eduardorizzo1/nvim-lua nvim && mv nvim "$HOME"/.config

cp dotfiles/.zshrc "$HOME"
cp dotfiles/.p10k.zsh "$HOME"
