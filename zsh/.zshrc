# ====== Powerlevel10k Instant prompt (keep top) ======
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# ====== ====== ======


# export LANG=en_US.UTF-8

# ====== Load plugin ======
source $ZDOTDIR/plugin/plugin.zsh
# ====== ====== ======

# ====== Load alias ======
source $ZDOTDIR/alias.zsh
# ====== ====== ======


autoload -U colors
colors

eval "$(dircolors -b ~/.zsh/.dircolors)"
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}


HISTFILE=$ZDOTDIR/zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] : "

setopt auto_cd
