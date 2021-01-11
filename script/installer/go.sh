#!/bin/sh -xeu

wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz

rm ./go1.15.6.linux-amd64.tar.gz

. ./script/installer/setpath.sh