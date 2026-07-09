# zsh/common.zsh — zsh-only config, all platforms.

# Reload the shell config
alias rs="source ~/.zshrc"

# fzf key bindings + completion (fzf >= 0.48)
command -v fzf >/dev/null && eval "$(fzf --zsh)"
