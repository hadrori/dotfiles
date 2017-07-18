### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

### Prompt ###
autoload -U colors
colors

# git prompt

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{075}(%F{078}%b%F{214}%u%c%{$reset_color%}%F{075})%{$reset_color%}'
zstyle ':vcs_info:*' actionformats '%R/(%a |%m )'
zstyle ':vcs_info:*' unstagedstr '%F{214}*%{$reset_color%}'
zstyle ':vcs_info:*' stagedstr '%F{green}*%{$reset_color%}'

autoload -Uz vcs_info
setopt prompt_subst

function precmd() {
    vcs_info
    PROMPT="%F{237}------------------------------------------------------------%{$reset_color%}
%F{032}%~%{$reset_color%} \
$(git_prompt_info)\
%F{105}%(!.#.$)%{$reset_color%} "
}

function git_prompt_info() {
    if [[ -n ${vcs_info_msg_0_} ]]; then
        echo "${vcs_info_msg_0_} "
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
        if git status --porcelain | grep '??' &> /dev/null ; then
            hook_com[staged]+='%F{214}+%{$reset_color%'}
        fi
    fi
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$F{red}%}%? ↵%{$reset_color%})"

PROMPT2="%{$F{red}%}\ %{$reset_color%}"
RPS1="${return_code}"
RPROMPT="%F{249}%n@%m%{$reset_color%}%"

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
