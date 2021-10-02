#!/bin/bash -x

# bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"

if ! type git >/dev/null 2>&1; then
    sudo apt install -y git
fi

git clone https://github.com/Sakurai00/dotfiles.git "$HOME/dotfiles"

export DOTDIR="$HOME/dotfiles/"

"$DOTDIR/script/install.sh"
"$DOTDIR/script/link.sh"
