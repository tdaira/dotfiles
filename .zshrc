# Set env
export PATH=/usr/local:$PATH
export PATH=/usr/local/programs/bin:$PATH
export PATH=$HOME/programs/bin:$PATH
export GOPATH=$HOME/programs
export GO111MODULE=on

# Alias
alias ls="ls -G"
alias la="ls -la"
alias vi="vim"
alias rm='trash'
alias mv='mv -i'
alias gaa="git add -A"
alias ga="git add"
alias gcm="git commit -m"
alias gpush="git push origin HEAD"
alias gpull="git pull"
alias gst="git status"
alias gs="git switch"
alias gsc="git switch -C"
alias gsm="git switch main"
alias gd="git diff"
alias gco="git checkout"

# History key mapping
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# Use color
autoload -Uz colors
colors

# History setting
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# Set prompt format
PROMPT="%{$fg[green]%}[%n %(5~,%-2~/.../%2~,%~)] %{$reset_color%}"

# Write git info on right side
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT='${vcs_info_msg_0_}'

# Keybind like emacs
bindkey -e

# completion
autoload -U compinit; compinit -C
# not case sensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Completion after sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# Read external plugins
for f in ~/.zsh/[0-9]*.(sh|zsh)
do
    source "$f"
done

