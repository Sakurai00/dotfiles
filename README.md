# dotfiles


## Installation
```bash
git clone https://github.com/Sakurai00/dotfiles.git
cd ./dotfiles
make ubuntu-init
make install

chsh -s $(which zsh)

zsh
tmux
C+q i
```

---
## ScreenShot
![](https://user-images.githubusercontent.com/54164011/120113830-440fe380-c1b7-11eb-9cb4-56a770d772c4.png)

---
## Components
- Terminal
  - alacritty (ayu mirage)
  - tmux

- Shell
  - Zsh (Powerlevel10k)
    - zinit

- Editor
  - neovim (ayu mirage)
    - dein.vim
  - vscode

- Lang
  - C/C++
  - Python
  - Rust
  - Go

- Font
  - MesloLGS NF

- other
  - Docker

---
## Commands & Key Config

### make
- make ubuntu-init  
ubuntu用initialization
- make install  
パッケージインストール
- make link  
シンボリックリンク作成

### shell command
```bash
alias ls="exa -F"
alias ll="exa -alF"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
alias vim="nvim"
alias cat="batcat"
```
### git
```bash
[alias]
	st = status
```
### tmux
- Prefix C-q


## 参考にしたもの
https://github.com/topics/dotfiles  
https://wiki.archlinux.jp/index.php/%E3%83%89%E3%83%83%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB  
https://github.com/b4b4r07/dotfiles
