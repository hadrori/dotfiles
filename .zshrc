# lang
export LANG=ja_JP.UTF-8

# color
autoload -Uz colors
colors

# emacs keybind
bindkey -e

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history

# comp
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# beep
setopt no_beep

# change directory
setopt auto_cd
setopt auto_pushd

