if [ -d "$HOME/.fzf" ] ; then
    export PATH="$HOME/.fzf/bin:$PATH"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null


# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"
source <(fzf --zsh)
export FZF_COMPLETION_TRIGGER=','


# Default Command
# ------------
if type rg > /dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='
        rg --files --hidden --follow --glob "!{.git}/**"
'
else
    export FZF_DEFAULT_COMMAND='
        find * -type f
'
fi

export FZF_DEFAULT_OPTS="
    --height 80%        # 絞り込みウィンドウの高さをウィンドウの80%に制限する
    --layout=reverse    # 絞り込み結果を上から表示
    --border=rounded    # fzfのウィンドウを囲う
    --multi             # TABで複数選択可能に
    --info=inline       # 検索結果数をプロンプトバーに表示する
"


# Ctrl + R
# ------------
export FZF_CTRL_R_OPTS="
    --preview 'echo {}'
    --preview-window up:3:hidden:wrap
    --bind 'ctrl-/:toggle-preview'
"


# Ctrl + T
# ------------
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if type bat > /dev/null 2>&1; then
    export FZF_CTRL_T_OPTS="
        --preview 'bat --style=numbers --color=always {}'
        --preview-window=right,70%,wrap
        --bind 'ctrl-/:toggle-preview'
"
else
    export FZF_CTRL_T_OPTS="
        --preview 'cat -n {}'
        --preview-window=right,70%,wrap
        --bind 'ctrl-/:toggle-preview'
"
fi


# Alt + C
# ------------
if type eza > /dev/null 2>&1; then
    export FZF_ALT_C_OPTS="
        --preview 'eza --tree --color=always {} | head -200'
"
else
    export FZF_ALT_C_OPTS="
        --preview 'tree -C {} | head -200'
"
fi


export FZF_TMUX=1
export FZF_TMUX_OPTS="-p 80%"


# https://wonderwall.hatenablog.com/entry/2017/10/06/063000
# https://github.com/junegunn/fzf/wiki/Configuring-shell-key-bindings
# https://github.com/junegunn/fzf/wiki/Examples
