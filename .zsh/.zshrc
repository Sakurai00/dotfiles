# ====== Powerlevel10k Instant prompt (keep top) ======
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ====== ====== ======


# export LANG=en_US.UTF-8


source $ZDOTDIR/plugin.zsh
source $ZDOTDIR/alias.zsh


autoload -Uz compinit && compinit


eval "$(dircolors -b ~/.zsh/.dircolors)"
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


setopt share_history
HISTFILE=$ZDOTDIR/zsh-history
HISTSIZE=100000
SAVEHIST=1000000


setopt hist_ignore_all_dups
setopt correct
setopt auto_cd
