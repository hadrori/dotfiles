export ZSH=/home/hadrori/.oh-my-zsh
export ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

plugins=(git ruby osx bundler brew rails emoji-clock)

# language
export LANG=ja_JP.UTF-8

# Clipboard
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"
