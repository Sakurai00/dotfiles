#!/bin/bash -x

ln -sf "$DOTDIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTDIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTDIR/.alacritty.yml" "$HOME/.alacritty.yml"

if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi
ln -sf "$DOTDIR/.zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTDIR/.zsh/.zshrc" "$HOME/.zsh/.zshrc"
ln -sf "$DOTDIR/.zsh/alias.zsh" "$HOME/.zsh/alias.zsh"
ln -sf "$DOTDIR/.zsh/plugin.zsh" "$HOME/.zsh/plugin.zsh"
ln -sf "$DOTDIR/.zsh/p10k.zsh" "$HOME/.zsh/p10k.zsh"
ln -sf "$DOTDIR/.zsh/.dircolors" "$HOME/.zsh/.dircolors"

if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir "$HOME/.config/nvim"
fi
ln -sf "$DOTDIR/.nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$DOTDIR/.nvim/dein.toml" "$HOME/.config/nvim/dein.toml"
