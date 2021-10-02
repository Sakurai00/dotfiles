#!/bin/bash -x

sudo apt update
sudo apt upgrade -y

zinit self-update

zinit update --all

anyenv update
