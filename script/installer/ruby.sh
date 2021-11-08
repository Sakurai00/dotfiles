#!/bin/bash -x
# Requires: anyenv
echo_module_name Ruby

# Install Requirements
if ! (is_exist "anyenv"); then
    ./script/installer/anyenv.sh
fi

# Install rbenv
anyenv install rbenv
eval "$(anyenv init -)"

# Install Ruby
rbenv install 3.0.2
rbenv global 3.0.2
