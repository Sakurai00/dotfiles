#!/bin/bash -x
# Requires: anyenv

function install_python(){
    echo_module_name python

    # Install Requirements
    if ! (is_exist "anyenv"); then
        install_anyenv
    fi

    # Install pyenv
    anyenv install pyenv
    eval "$(anyenv init -)"

    # Install Python
    pyenv install 3.9.13
    pyenv global 3.9.13

    # Install pip
    sudo apt install -y python3-pip

    # Install poetry
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - --no-modify-path
    source "$HOME/.poetry/env"
    poetry config virtualenvs.in-project true
}

function update_python(){
    # Update pyenv
    update_anyenv

    # Update pip
    sudo apt upgrade -y python3-pip

    # Update poetry
    poetry self update
}