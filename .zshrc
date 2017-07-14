source "$HOME/.zsh-theme.sh"

# History
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY

# User configuration
export PATH="$PATH:/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.rbenv/shims:/opt/brew/bin:/opt/brew/sbin:/Users/hadrori/.henv/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

SHELL="$(brew --prefix)/bin/zsh"

# language
export LANG=ja_JP.UTF-8

# init henv
eval "$(~/.henv/bin/henv init)"

# alias
alias rx="rbenv exec"
alias bx="rbenv exec bundle exec"
alias g++="g++-6 -O2 -Wall -std=c++11"
alias topcoder="open ~/Codes/procon/SRM/ContestAppletProd.jnlp"

function texpdf() { platex $1.tex; dvipdfmx $1.dvi; open $1.pdf; }

# GO
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
export GOPATH=$HOME/Codes/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"

# Load local configuration
if [[ -e "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
