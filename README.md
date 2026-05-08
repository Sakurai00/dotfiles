# dotfiles

---
## Installation
```bash
bash -c "$(curl -L raw.github.com/Sakurai00/dotfiles/master/init.sh)"
```

```bash
chsh -s $(which zsh)
```

---
## Components
- Shell
  - zsh
    - Plugin manager: zinit
    - Prompt: Powerlevel10k
  - Fuzzy finder: fzf

- Multiplexer
  - tmux
    - tmux plugin manager: TPM

- Editors
  - Neovim
  - Vim

- Languages
  - C/C++
  - Python
    - Package manager: uv
  - Rust
    - Package manager: Cargo
  - Go
    - Runtime manager: mise
  - Node.js
    - Runtime manager: mise
  - pnpm
    - Runtime manager: mise

- Containers
  - Docker

---
## Commands & Key Config

### shell command
```bash
alias ls="eza -F"
alias lt='eza -aT -I ".git|.github"'
alias ll="eza -alF --git"
alias llt='eza -alFT -I ".git"'
alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
alias g="git"
alias vim="nvim"
alias cat="bat"
alias tm3='tmux new-session \; split-window -h \; split-window -v \;'
```
### git
```bash
[alias]
	st = status -sb
	co = checkout
	sw = switch
	br = branch
	ci = commit
	ca = commit --amend --no-edit
	pl = pull
	df = diff --color-words -w
	unstage = restore --staged
	l = log --date=format:'%Y/%m/%d %H:%M:%S' --pretty=format:'%C(green)%h %C(reset)%cd %C(blue)%cn %C(red)%d %C(reset)%s'
	graph = log --graph --pretty=format:'%C(yellow)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%cr) %C(bold blue)<%an>%C(reset)'
```
### tmux
- Prefix C-q
- Split panes: `|` / `-`
- Move panes: `h` `j` `k` `l`
