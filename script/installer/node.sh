#!/bin/bash -x
. ./script/function.sh

echo_module_name node

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

chmod 755 ~/.nvm/nvm.sh
. ~/.nvm/nvm.sh

nvm install --lts

sudo apt install -y npm