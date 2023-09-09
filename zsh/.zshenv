export DOTDIR="$HOME/dotfiles"
export ZDOTDIR="$HOME/.zsh"


if [ -d "$HOME/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/lib" ] ; then
    export PATH="$HOME/.local/lib:$PATH"
fi

if [ -d "$HOME/.cargo" ] ; then
    source "$HOME/.cargo/env"
fi
. "$HOME/.cargo/env"

# if [ -d "$HOME/.poetry" ] ; then
#     source "$HOME/.poetry/env"
# fi

if [ -d "$HOME/.volta" ] ; then
    export VOLTA_HOME="$HOME/.volta"
    export PATH="$VOLTA_HOME/bin:$PATH"
fi
