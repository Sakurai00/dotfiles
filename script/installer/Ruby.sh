#!/bin/bash -x
source "$DOTDIR/script/function.sh"
echo_module_name Ruby


# Install rbenv
if [ ! -d "$HOME/.rbenv" ]; then
    git clone https://github.com/rbenv/rbenv.git "$HOME/.rbenv"
fi
cd "$HOME/.rbenv" && src/configure && make -C src

source "$HOME/.zshenv"


# Install ruby-build
if [ ! -d "$HOME/.rbenv/plugins/ruby-build" ]; then
    git clone https://github.com/rbenv/ruby-build.git "$HOME/.rbenv/plugins/ruby-build"
fi

rbenv install 3.0.2
rbenv global 3.0.2