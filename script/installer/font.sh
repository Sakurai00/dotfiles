#!/bin/bash -x
echo_module_name fonts

if ! (is_WSL); then
    sudo apt install -y gnome-font-viewer
fi

export FONT_DIR="$HOME/.local/share/fonts"
export SOURCE_DIR="$DOTDIR/fonts"

if [ ! -d "$HOME/.local/share/fonts" ]; then
    mkdir "$HOME/.local/share/fonts"
fi

if [ ! -d "$HOME/dotfiles/fonts/font" ]; then
    mkdir -p "$HOME/dotfiles/fonts/font"
fi

curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -o "$SOURCE_DIR/font/MesloLGS NF Regular.ttf"

curl -L https://github.com/adobe-fonts/source-han-code-jp/archive/refs/tags/2.012R.tar.gz -o "$SOURCE_DIR/source-han-code.tar.gz"
tar -zxvf "$SOURCE_DIR/source-han-code.tar.gz" -C "$SOURCE_DIR"
cp -RT "$SOURCE_DIR/source-han-code-jp-2.012R/OTF/" "$SOURCE_DIR/font/source-han-code-jp/"

curl -L https://github.com/yuru7/PlemolJP/releases/download/v1.1.0/PlemolJP_NF_v1.1.0.zip -o "$SOURCE_DIR/PlemolJP_NF.zip"
unzip -d "$SOURCE_DIR/font" "$SOURCE_DIR/PlemolJP_NF.zip"

cp -RT "$SOURCE_DIR/font/" "$FONT_DIR"
fc-cache -fv
