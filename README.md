# dotfiles


## Installation
```bash
git clone https://github.com/Sakurai00/dotfiles.git
cd ./dotfiles
make ubuntu-init
make install
chsh -s $(which zsh)
```
~~font install
https://github.com/romkatv/powerlevel10k/blob/master/font.md~~

---
## Components
- Terminal
  - alacritty
  - tmux

- Shell
  - Zsh
    - zinit

- Editor
  - neovim
    - dein.vim
  - vscode

---
## ScreenShot
![](https://user-images.githubusercontent.com/54164011/114970880-41cb2180-9eb6-11eb-8348-f8f84e32d6be.png)
![](https://user-images.githubusercontent.com/54164011/114970646-c79a9d00-9eb5-11eb-8975-f134546d4a97.png)

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
