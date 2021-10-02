#!/bin/bash -x
# Requires: git, anyenv
source "$DOTDIR/script/function.sh"
echo_module_name python

# Install pyenv
anyenv install pyenv

eval "$(anyenv init -)"

# Install Python
pyenv install 3.9.5
pyenv global 3.9.5

# Install pip
sudo apt install -y python3-pip

# Install poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python3 -
