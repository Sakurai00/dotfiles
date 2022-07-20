#!/bin/bash
source "$HOME/dotfiles/script/set_path.sh" && set -x
cd "$DOTDIR" || exit

sudo ln -sf "$DOTDIR/apt-fast.conf" "/etc/apt-fast.conf"
ln -sf "$DOTDIR/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTDIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTDIR/.alacritty.yml" "$HOME/.alacritty.yml"

# Link zsh
if [ ! -d "$HOME/.zsh" ]; then
    mkdir "$HOME/.zsh"
fi
ln -sf "$DOTDIR/.zsh/.zshenv" "$HOME/.zshenv"
ln -sf "$DOTDIR/.zsh/.zshrc" "$ZDOTDIR/.zshrc"
ln -sf "$DOTDIR/.zsh/alias.zsh" "$ZDOTDIR/alias.zsh"
ln -sf "$DOTDIR/.zsh/plugin.zsh" "$ZDOTDIR/plugin.zsh"
ln -sf "$DOTDIR/.zsh/p10k.zsh" "$ZDOTDIR/p10k.zsh"
ln -sf "$DOTDIR/.zsh/.dircolors" "$ZDOTDIR/.dircolors"

# Link vim
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir -p "$HOME/.config/nvim"
fi
ln -sf "$DOTDIR/.nvim/init.vim" "$HOME/.config/nvim/init.vim"
ln -sf "$DOTDIR/.nvim/dein.toml" "$HOME/.config/nvim/dein.toml"
