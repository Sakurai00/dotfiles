export DOTDIR="$HOME/dotfiles/"
export ZDOTDIR=$HOME/.zsh
export PATH="$DOTDIR/script/functions:$PATH"


if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/lib" ] ; then
    export PATH="$HOME/.local/lib:$PATH"
fi

if [ -d "/usr/local/go/bin" ] ; then
    export PATH="/usr/local/go/bin:$PATH"
fi

if [ -d "$HOME/go/bin" ] ; then
    export PATH="$HOME/go/bin:$PATH"
fi

if [ -d "$HOME/.anyenv/bin" ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
fi

if [ -d "$HOME/.cargo" ] ; then
    source "$HOME/.cargo/env"
fi
