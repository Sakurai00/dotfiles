#!/bin/bash -x
# Requires: anyenv

function install_ruby() {
    # Install Requirements
    if ! (is_exist "anyenv"); then
        install_anyenv
    fi

    # Install rbenv
    anyenv install rbenv
    eval "$(anyenv init -)"

    # Install Ruby
    rbenv install 3.0.2
    rbenv global 3.0.2
}
