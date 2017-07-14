source "$HOME/.zsh-theme.sh"

# History
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY

# User configuration
export PATH="$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Clipboard
alias pbcopy="xsel --clipboard --input"
alias pbpaste="xsel --clipboard --output"

# Load local configuration
if [[ -e "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi
