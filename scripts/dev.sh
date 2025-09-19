#!/usr/bin/env bash

# nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.zshrc && nvm install --lts

# tmux
yay -S tmux
cp "$HOME"/dotfiles/.tmux.conf "$HOME"
cp -r "$HOME"/dotfiles/tmux "$HOME"/.config
