#!/bin/bash -x
# Requires: Go
source "$DOTDIR/script/function.sh"
echo_module_name lazygit


# Install lazygit
# https://github.com/jesseduffield/lazygit
go get github.com/jesseduffield/lazygit