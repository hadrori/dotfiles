autoload -U colors
colors

# git prompt

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{075}(%F{078}%b%F{214}%u%c%F{075})'
zstyle ':vcs_info:*' actionformats '%R/(%a |%m )'
zstyle ':vcs_info:*' unstagedstr '%F{214}*'
zstyle ':vcs_info:*' stagedstr '%F{green}*'

autoload -Uz vcs_info
setopt prompt_subst

function precmd() {
    vcs_info
    PROMPT="%F{237}------------------------------------------------------------
%F{032}%~\
$(git_prompt_info) \
%F{105}$%f "
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

# if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$F{red}%}%? ↵)%f"

PROMPT2="%{$F{red}%}\ "
RPS1="${return_code}"
RPROMPT="%F{249}%n@%m%f"

# ls
export LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
