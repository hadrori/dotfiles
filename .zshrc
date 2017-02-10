export ZSH=~/.oh-my-zsh
export ZSH_THEME="af-magic"
source $ZSH/oh-my-zsh.sh

# User configuration
# export PATH="/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.rbenv/shims:/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.henv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

export PATH=$PATH:/mingw64/bin:/home/hadrori/.cask/bin:/home/hadrori/.rbenv/bin

plugins=(git ruby bundler rails emoji-clock)
# SHELL="$(brew --prefix)/bin/zsh"

# # language
# export LANG=ja_JP.UTF-8

# # init henv
# eval "$(~/.henv/bin/henv init)"

# # alias
# alias rx="rbenv exec"
# alias bx="rbenv exec bundle exec"
alias g++="g++ -O2 -Wall -std=c++11"
# alias topcoder="open ~/Codes/procon/SRM/ContestAppletProd.jnlp"

# function texpdf() { platex $1.tex; dvipdfmx $1.dvi; open $1.pdf; }

# # GO
# export GOPATH=$HOME/Codes/go
# export GOBIN=$GOPATH/bin
# export PATH=$PATH:$GOBIN

# export PYENV_ROOT="${HOME}/.pyenv"
# export PATH=${PYENV_ROOT}/bin:$PATH
# eval "$(pyenv init -)"

# Copy & Paste
function pbcopy() {
    cat -> /dev/clipboard
}

function pbpaste() {
    cat /dev/clipboard
}

# ruby
eval "$(rbenv init)"
