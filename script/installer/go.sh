#!/bin/bash
. ./script/function.sh

echo_module_name go

wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

rm ./go1.15.6.linux-amd64.tar.gz

if ! (is_WSL); then
    export PATH=$PATH:/usr/local/go/bin
fi
