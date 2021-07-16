#!/bin/bash -x

ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.alacritty.yml ~/.alacritty.yml


if [ ! -d ~/.zsh ]; then
    mkdir ~/.zsh
fi
ln -sf ~/dotfiles/.zsh/.zshrc ~/.zsh/.zshrc
ln -sf ~/dotfiles/.zsh/alias.zsh ~/.zsh/alias.zsh
ln -sf ~/dotfiles/.zsh/plugin.zsh ~/.zsh/plugin.zsh
ln -sf ~/dotfiles/.zsh/p10k.zsh ~/.zsh/p10k.zsh
ln -sf ~/dotfiles/.zsh/.dircolors ~/.zsh/.dircolors


if [ ! -d ~/.config/nvim ]; then
    mkdir ~/.config/nvim
fi
ln -sf ~/dotfiles/.nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.nvim/dein.toml ~/.config/nvim/dein.toml
