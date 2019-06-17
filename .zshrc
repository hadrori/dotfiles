### History ###
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history
setopt share_history

### Prompt ###
autoload -U colors
colors

### PATH ###
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}

# Prepend a value to the beginning of the PATH iff it is not already present in PATH
path__prepend() {
    local already_in_path
    contains "$PATH" "$1" && already_in_path=true
    force="$2"

    if [ -n "${force}" ] || ([ -d "$1" ] && [ -z "${already_in_path}" ]); then
        if [ -z "${PATH}" ]; then
            PATH="$1"
        else
            PATH="$1:$PATH"
        fi
    fi
}

# git settings
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{075}(%F{078}%b%F{214}%u%c%F{075})'
zstyle ':vcs_info:*' actionformats '%F{075}(%F{078}%b%F{075}|%F{214}%a%F{075})'
zstyle ':vcs_info:*' unstagedstr '%F{214}*'
zstyle ':vcs_info:*' stagedstr '%F{green}*'

autoload -Uz vcs_info
setopt prompt_subst

function precmd() {
    vcs_info
    PROMPT="%F{237}------------------------------------------------------------
%F{123}%~\
$(git_prompt_info) \
%F{105}$%f "
    print -Pn "\e]0;${PWD##*/}\a"
}

function git_prompt_info() {
    if [[ -n ${vcs_info_msg_0_} ]]; then
        echo "${vcs_info_msg_0_}"
    fi
}

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
function +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
        if git status --porcelain | grep '??' &> /dev/null ; then
            hook_com[staged]+='%F{214}+'
        fi
    fi
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$F{red}%}%? ↵)%f"

PROMPT2="%{$F{red}%}\ "
RPS1="${return_code}"
RPROMPT="%F{249}%n@%m%f %F{249}[%D{%F %T}]"

### LS ###
alias ls="ls --color=auto"
export LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
### For OSX LS ###
# add `alias ls="ls -G"` to ~/.zshrc.local
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegexabagacad

### cd history ###
setopt auto_pushd
autoload -U read-from-minibuffer
function popd-in-place() {
    if [[ `dirs -p | wc -l` -eq 1 ]]; then
        read-from-minibuffer -k 1 "directory stack empty"
    else
        popd > /dev/null
        zle reset-prompt
    fi
}
zle -N popd-in-place

### keybind ###
bindkey '^O' popd-in-place

### User configuration ###
path__prepend "/sbin"
path__prepend "/usr/sbin"
path__prepend "/bin"
path__prepend "/usr/bin"
path__prepend "/usr/local/bin"

### Clipboard ###

case ${OSTYPE} in
    darwin*)
        ;;
    linux*)
        alias pbcopy="xsel --clipboard --input"
        alias pbpaste="xsel --clipboard --output"
        ;;
esac

### Load local configuration ###
if [[ -e "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
