# ====== Zinit installer ======
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
# ====== ====== ======


# ====== Load Zinit ======
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# ====== ====== ======


# ====== Completion ======
zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit wait'1' lucid as"completion" is-snippet for \
  https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker \
  https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose \
  https://github.com/ilikenwf/apt-fast/blob/master/completions/zsh/_apt-fast \
  https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty \
  https://github.com/jdx/mise/blob/main/completions/_mise \


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

# ====== ====== ======


# ====== Load Zinit plugins ======
zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light zdharma-continuum/fast-syntax-highlighting

# History search based on substring
zinit ice lucid wait'0' atload'
    bindkey "^[[A" history-substring-search-up
    bindkey "^[[B" history-substring-search-down
'
zinit light zsh-users/zsh-history-substring-search
# ====== ====== ======
