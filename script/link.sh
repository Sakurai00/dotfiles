#!/bin/bash -x

ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.alacritty.yml ~/.alacritty.yml


if [ ! -d ~/.zsh ]; then
    mkdir ~/.zsh
fi
ln -sfn ~/dotfiles/.zsh ~/.zsh


if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi
ln -sfn ~/dotfiles/nvim ~/.config/
