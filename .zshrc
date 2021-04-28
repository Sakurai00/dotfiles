# ====== Powerlevel10k keep top ======
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ====== ====== ======


# ====== Zinit installer ======
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ====== ====== ======


# ====== Powerlevel10k settings ======
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# ====== ====== ======


# export LANG=en_US.UTF-8
eval "$(dircolors -b ~/.dircolors)"

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zdharma/history-search-multi-word


autoload -Uz compinit && compinit
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


setopt share_history
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000


setopt hist_ignore_all_dups
setopt correct
setopt auto_cd


if type exa > /dev/null 2>&1; then
    alias ls="exa -F"
    alias ll="exa -alF --git"
    alias llt="exa -alFT -I '.git'"
fi
alias cpi="cp -i"
alias mvi="mv -i"
alias rmi="rm -i"
alias his="history"
alias relogin="exec $SHELL -l"
if type nvim > /dev/null 2>&1; then
    alias vim="nvim"
fi
if type batcat > /dev/null 2>&1; then
    alias cat="batcat"
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
