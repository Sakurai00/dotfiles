#!/bin/bash -x
# Requires: anyenv
echo_module_name python

# Install Requirements
if ! (is_exist "anyenv"); then
    ./script/installer/anyenv.sh
fi

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
