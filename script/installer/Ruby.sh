#!/bin/bash -x
. ./script/function.sh
echo_module_name Ruby


# Install rbenv
if [ ! -d ~/.rbenv ]; then
    git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi
cd ~/.rbenv && src/configure && make -C src

source ~/.zshenv

# Install ruby-build
if [ ! -d ~/.rbenv/plugins/ruby-build ]; then
    git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

rbenv install 3.0.2
rbenv global 3.0.2