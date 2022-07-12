#!/bin/bash -x

find "$DOTDIR/script/installer/" -type f -exec chmod 755 {} +

find "$DOTDIR/script/functions/" -type f -exec chmod 755 {} +
