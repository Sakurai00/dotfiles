# Completion Initialization
# -----------------------------------------
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.m-1) ]]; then
    compinit -C
else
    compinit
fi


# Plugin Installation
# -----------------------------------------
zinit wait'0' lucid for \
    blockf atpull'zinit creinstall -q .' zsh-users/zsh-completions \
    atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions

zinit wait'1' lucid as"completion" is-snippet for \
    https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty

if type kubectl > /dev/null 2>&1; then
    source <(kubectl completion zsh)
fi


# Completion Styles
# -----------------------------------------

zstyle ':completion:*:default' menu select=1
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:*:*:*:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}--- %d ---%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# 曖昧検索
zstyle ':completion:*' matcher-list '' \
    'm:{a-z}={A-Z}' \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'


# Zsh Options
# -----------------------------------------
setopt menu_complete       # 補完候補が1つの場合は即座に挿入
setopt magic_equal_subst   # 引数=パス などの形式でも補完を有効化
setopt auto_param_slash    # ディレクトリ補完時に末尾にスラッシュを自動付与
setopt list_types          # 補完候補にファイル種別の識別マークを表示
setopt auto_cd             # ディレクトリ名のみで移動
setopt complete_in_word    # カーソル位置で補完
setopt auto_list           # 補完候補を自動で一覧表示
setopt always_to_end       # 補完確定時にカーソルを末尾へ移動
