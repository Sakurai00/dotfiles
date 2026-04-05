#!/bin/bash -x

# bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"

OS="$(uname)"

if [ "$OS" == "Darwin" ]; then
    # macOS setup
    if ! type brew >/dev/null 2>&1; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [ -f /opt/homebrew/bin/brew ]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        elif [ -f /usr/local/bin/brew ]; then
            eval "$(/usr/local/bin/brew shellenv)"
        fi
    fi
    if ! type git >/dev/null 2>&1; then
        brew install git
    fi
    if ! type ansible >/dev/null 2>&1; then
        brew install ansible
    fi
elif [ "$OS" == "Linux" ]; then
    # Linux setup (assuming Debian/Ubuntu)
    if ! type git >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y git
    fi

    if ! type pip >/dev/null 2>&1; then
        sudo apt update && sudo apt install -y python3-pip
    fi

    if ! type ansible >/dev/null 2>&1; then
        pip3 install --user ansible
        export PATH="$HOME/.local/bin:$PATH"
    fi
else
    echo "Unsupported OS: $OS"
    exit 1
fi

# Clone/Update dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
    git clone https://github.com/Sakurai00/dotfiles.git "$HOME/dotfiles"
    cd "$HOME/dotfiles" || exit
else
    cd "$HOME/dotfiles" || exit
    git pull
fi

# Determine tags to run
TAGS="zsh,fzf"
# Add minimum/normal tags if you want to include other basic roles
# TAGS="minimum,normal"

ansible-playbook -i ./inventories/production/hosts.yml ./playbook.yml --ask-become-pass --tags "$TAGS"
