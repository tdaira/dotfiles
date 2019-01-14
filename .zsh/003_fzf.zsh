# Enables cdr, add-zsh-hook
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
# Settings of cdr
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-max 500
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-file "$HOME/.chpwd-recent-dirs"
zstyle ':chpwd:*' recent-dirs-pushd true

# interactive cdr
function interactive-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        BUFFER="cd ${target_dir}"
        zle accept-line
    fi
}
zle -N interactive-cdr
bindkey '^rd' interactive-cdr

# repeat history
function repeat-history() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}
zle -N repeat-history
bindkey '^rh' repeat-history
