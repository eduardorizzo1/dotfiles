# Yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git ~
cd yay || return
makepkg -si
yay -Syu

# Dotfiles
git clone http://github.com/eduardorizzo1/dotfiles

# Neovim
yay -S neovim-nightly ripgrep wl-clipboard wl-copy wl-paste lua
git clone http://github.com/eduardorizzo1/nvim-lua nvim && mv nvim "$HOME"/.config

# oh-my-zsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/themes/powerlevel10k

cp dotfiles/.zshrc "$HOME"
cp dotfiles/.p10k.zsh "$HOME"
