#!/bin/sh -x

ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.dircolors ~/.dircolors
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.p10k.zsh ~/.p10k.zsh
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.alacritty.yml ~/.alacritty.yml



if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
ln -sf ~/dotfiles/nvim ~/.config/nvim
