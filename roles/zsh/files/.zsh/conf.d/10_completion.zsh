# ====== Completion ======
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit wait'1' lucid as"completion" is-snippet for \
  https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
  https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
  https://github.com/ilikenwf/apt-fast/blob/master/completions/zsh/_apt-fast \
  https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty


if type kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
fi




zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:*:*:*:*' group-name '' # 補完候補の視覚的なグルーピング
zstyle ':completion:*:descriptions' format '%F{yellow}--- %d ---%f' # 補完候補に説明を追加する
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} # 補完候補のカラーリング

# 曖昧検索
zstyle ':completion:*' matcher-list '' \
    'm:{a-z}={A-Z}' \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'


setopt menu_complete # 補完の即時開始
setopt magic_equal_subst # 引数も補完
setopt auto_param_slash # ディレクトリの補完後末尾に/をつける
setopt list_types # 補完に識別アイコンを付ける
setopt auto_cd
setopt complete_in_word # 単語の途中からでも補完を起動できるようにする
setopt auto_list # 補完候補を一覧表示した際に、自動でメニュー選択を開始する
setopt always_to_end # 補完が確定したら、カーソルを単語の末尾に移動する
