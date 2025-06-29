# ====== Load conf.d ======
for file in $(find $ZDOTDIR/conf.d -name "*.zsh" | sort); do
  source $file
done
# ====== ====== ======


autoload -U colors && colors
eval "$(dircolors -b ~/.zsh/.dircolors)"


# 補完
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # 補完のカラー表示
zstyle ':completion:*:default' menu select=1 # 補完の選択/ハイライト
zstyle ':completion::complete:*' use-cache true # キャッシュを使用
setopt menu_complete # 補完の即時開始


# 履歴
HISTFILE=$ZDOTDIR/zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt share_history
setopt inc_append_history
setopt hist_ignore_all_dups # 重複排除
setopt hist_reduce_blanks # 余分な空白排除


setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] : "


setopt auto_cd
setopt ignore_eof
