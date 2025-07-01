# ====== Load conf.d ======
for file in $(find $ZDOTDIR/conf.d -name "*.zsh" | sort); do
  source $file
done
# ====== ====== ======


autoload -U colors && colors
eval "$(dircolors -b ~/.zsh/.dircolors)"


# 補完
setopt menu_complete # 補完の即時開始
setopt magic_equal_subst # 引数も補完
setopt auto_param_slash # ディレクトリの補完後末尾に/をつける
setopt list_types # 補完に識別アイコンを付ける
setopt auto_cd
setopt complete_in_word # 単語の途中からでも補完を起動できるようにする
setopt auto_list # 補完候補を一覧表示した際に、自動でメニュー選択を開始する
setopt always_to_end # 補完が確定したら、カーソルを単語の末尾に移動する

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
