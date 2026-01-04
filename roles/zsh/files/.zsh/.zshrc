# ====== Load conf.d ======
for file in $(find $ZDOTDIR/conf.d -name "*.zsh" | sort); do
  source $file
done
# ====== ====== ======


autoload -U colors && colors
eval "$(dircolors -b ~/.zsh/.dircolors)"


# 履歴
HISTFILE=$ZDOTDIR/zsh-history
HISTSIZE=100000
SAVEHIST=1000000
setopt share_history # 履歴を複数端末で共有する
setopt inc_append_history
setopt hist_ignore_all_dups # 重複排除
setopt hist_reduce_blanks # 余分な空白排除
setopt extended_history # 時刻の記録
setopt hist_verify # ヒストリを呼び出し後編集可能にする
setopt auto_pushd # cd <TAB>で履歴表示
setopt pushd_ignore_dups # 重複するディレクトリは記憶しない


setopt correct
SPROMPT="correct: $RED%R$DEFAULT -> $GREEN%r$DEFAULT ? [Yes/No/Abort/Edit] : "


setopt ignore_eof

setopt notify # ジョブ通知
