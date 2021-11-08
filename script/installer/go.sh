#!/bin/bash -x
echo_module_name Go

# Install Go
wget https://golang.org/dl/go1.17.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.17.3.linux-amd64.tar.gz
rm ./go1.17.3.linux-amd64.tar.gz

source "$DOTDIR/.zshenv"
