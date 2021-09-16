#!/bin/bash -x
. ./script/function.sh
echo_module_name python


#sudo apt install -y python3
sudo apt install -y python3-pip

# Install pyenv
if [ ! -d ~/.pyenv ]; then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi
cd ~/.pyenv && src/configure && make -C src

source ~/.zshenv

pyenv install 3.9.5
pyenv global 3.9.5

# Install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python3 -
