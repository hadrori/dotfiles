autoload -U colors
colors

# git prompt

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{075}(%F{078}%b%F{075})%{$reset_color%}'
zstyle ':vcs_info:*' actionformats '%R/(%a |%m )'
zstyle ':vcs_info:*' unstagedstr '%F{214}*%{$reset_color%}'
zstyle ':vcs_info:*' stagedstr '%F{214}+%{$reset_color%}'

autoload -Uz vcs_info
setopt prompt_subst

function precmd() {
    vcs_info
    PROMPT="%F{237}------------------------------------------------------------%{$reset_color%}
%F{032}%~%{$reset_color%} \
$(git_prompt_info)\
%F{105}%(!.#.$)%{$reset_color%} "
}

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$F{red}%}%? ↵%{$reset_color%})"# 

function git_prompt_info() {
    if [[ -n ${vcs_info_msg_0_} ]]; then
        echo "${vcs_info_msg_0_} "
    fi
}

# primary prompt
PROMPT2="%{$F{red}%}\ %{$reset_color%}"
RPS1="${return_code}"

# right prompt
RPROMPT="%F{249}%n@%m%{$reset_color%}%"
