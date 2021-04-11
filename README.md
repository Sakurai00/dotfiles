# dotfiles

## Installation
```bash
git clone https://github.com/Sakurai00/dotfiles.git
cd ./dotfiles
make ubuntu-init
chsh -s $(which zsh)
```
~~font install
https://github.com/romkatv/powerlevel10k/blob/master/font.md~~

## Key

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


## 参考
https://github.com/topics/dotfiles  
https://wiki.archlinux.jp/index.php/%E3%83%89%E3%83%83%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB  
https://github.com/b4b4r07/dotfiles
