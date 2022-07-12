#!/bin/bash -x
# Requires: anyenv

function install_go() {
    # Install Requirements
    if ! (is_exist "anyenv"); then
        install_anyenv
    fi

    # Install goenv
    anyenv install goenv
    eval "$(anyenv init -)"

    # Install Go
    goenv install 1.18.3
    goenv global 1.18.3
}

function update_go(){
    # Update goenv
    update_anyenv
}
