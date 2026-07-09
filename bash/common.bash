# bash/common.bash — bash-only config, all platforms.

# Reload the shell config
alias rs="source ~/.bashrc"

# fzf key bindings + completion (fzf >= 0.48)
command -v fzf >/dev/null && eval "$(fzf --bash)"
