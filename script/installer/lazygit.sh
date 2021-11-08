#!/bin/bash -x
# Requires: Go
echo_module_name lazygit

# Install Requirements
if ! (is_exist "go"); then
    ./script/installer/go.sh
fi

# Install lazygit
# https://github.com/jesseduffield/lazygit
go get github.com/jesseduffield/lazygit
