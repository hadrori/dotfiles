export ZSH=/Users/hadrori/.oh-my-zsh
export ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.rbenv/shims:/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.henv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

plugins=(git ruby osx bundler brew rails emoji-clock)
SHELL="$(brew --prefix)/bin/zsh"

# language
export LANG=ja_JP.UTF-8

# init henv
eval "$(~/.henv/bin/henv init)"

# alias
alias rx="rbenv exec"
alias bx="rbenv exec bundle exec"
alias g++="g++-6 -O2 -Wall -std=c++11"

function texpdf() { platex $1.tex; dvipdfmx $1.dvi; open $1.pdf; }

# GO
export GOPATH=$HOME/Codes/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
