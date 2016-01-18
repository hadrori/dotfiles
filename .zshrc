export ZSH=/Users/hadrori/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git ruby osx bundler brew rails emoji-clock)
SHELL="$(brew --prefix)/bin/zsh"

# User configuration
export PATH="/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.rbenv/shims:/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.henv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin"
source $ZSH/oh-my-zsh.sh

# language
export LANG=ja_JP.UTF-8

# init henv
eval "$(~/.henv/bin/henv init)"

# alias
alias emacs="emacs -nw"
