#!/bin/bash -x

# bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"

if ! type git >/dev/null 2>&1; then
    sudo apt install -y git
fi

if [ ! -d "$HOME/dotfiles" ]; then
    git clone https://github.com/Sakurai00/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles" || exit
else
    cd "$HOME/dotfiles" || exit
    git pull
fi

make install
