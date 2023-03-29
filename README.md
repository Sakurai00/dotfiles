# dotfiles

<details>
<summary>Table of Contents</summary>

## TOC
- [dotfiles](#dotfiles)
  - [TOC](#toc)
  - [Installation](#installation)
  - [ScreenShot](#screenshot)
  - [Components](#components)
  - [Tree](#tree)
  - [Commands \& Key Config](#commands--key-config)
    - [shell command](#shell-command)
    - [git](#git)
    - [tmux](#tmux)
  - [参考](#参考)

</details>

---
## Installation
```bash
bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"
```

```bash
chsh -s $(which zsh)

zsh
tmux
C+q I
```

---
## ScreenShot
![](https://user-images.githubusercontent.com/54164011/120113830-440fe380-c1b7-11eb-9cb4-56a770d772c4.png)

---
## Components
- Terminal
  - tmux

- Shell
  - Zsh (Powerlevel10k)
    - zinit

- Editor
  - neovim (ayu mirage)
    - dein.vim

- Lang
  - C/C++
  - Python (asdf, poetry)
  - Rust
  - Go (asdf)

---
## Tree
```bash
.
├── .gitignore
├── Alacritty
│  └── .alacritty.yml
├── ansible
│  ├── playbook.yml
│  ├── roles
│  │  ├── asdf
│  │  │  ├── defaults
│  │  │  │  └── main.yml
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── C
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── cli_tools
│  │  │  ├── meta
│  │  │  │  └── main.yml
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── common
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── go
│  │  │  ├── defaults
│  │  │  │  └── main.yml
│  │  │  ├── meta
│  │  │  │  └── main.yml
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── neovim
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── python
│  │  │  ├── defaults
│  │  │  │  └── main.yml
│  │  │  ├── meta
│  │  │  │  └── main.yml
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── rust
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── tmux
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  ├── vim
│  │  │  └── tasks
│  │  │     └── main.yml
│  │  └── zsh
│  │     └── tasks
│  │        └── main.yml
│  ├── test.yml
│  └── vars
│     └── env.yml
├── apt-fast
│  └── apt-fast.conf
├── git
│  └── .gitconfig
├── init.sh
├── neovim
│  ├── dein.toml
│  └── init.vim
├── README.md
├── tmux
│  └── .tmux.conf
└── zsh
   ├── .dircolors
   ├── .zshenv
   ├── .zshrc
   ├── alias.zsh
   ├── plugin.p10k.zsh
   └── plugin.zsh
```

---
## Commands & Key Config

### shell command
```bash
alias ls="exa -F"
alias lt="exa -aT -I '.git|.github'"
alias ll="exa -alF --git"
alias llt="exa -alFT -I '.git'"
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
	st = status -sb
	df = diff --color-words -w
	tree = log --graph --oneline
	logl = log --date=format:'%Y/%m/%d %H:%M:%S' --pretty=format:'%C(green)%h %C(reset)%cd %C(blue)%cn %C(red)%d %C(reset)%s'
```
### tmux
- Prefix C-q


## 参考
https://github.com/topics/dotfiles
https://wiki.archlinux.jp/index.php/%E3%83%89%E3%83%83%E3%83%88%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB
https://github.com/b4b4r07/dotfiles
