#!/bin/bash

export DOTDIR="$HOME/dotfiles"

export ZDOTDIR="$HOME/.zsh"
export PATH="$DOTDIR/script/functions:$PATH"

for f in $(find "$DOTDIR/script/installer/" -name \*.sh); do
  source "$f"
done
