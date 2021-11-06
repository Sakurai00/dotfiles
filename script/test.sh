#!/bin/bash -x

if (ask_yn "Install Docker? (y/n)"); then
    echo "yes"
else
    echo "no"
fi


if is_exist "ls"; then
    echo "is exist"
else
    echo "is not exist"
fi