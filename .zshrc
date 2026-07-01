# Put user bin first
export PATH=$HOME/bin:/opt/homebrew/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
# Add code (vscode) command to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# why is this needed, should be linked to main brew bin?
export PATH="$PATH:/opt/homebrew/opt/postgresql@12/bin"
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# env maybe move to .zshenv
export KUBECONFIG=${HOME}/.kube/config

# golang configs
export GOPATH=$HOME/go
export GOBIN=$HOME/bin
export PATH=$PATH:$GOPATH/bin


# Setup NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Volta Setup
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# later versions of osx with brew at
# export NVM_DIR="$HOME/.nvm"
# # This loads nvm
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ZSH="$HOME/.oh-my-zsh"
# OHMYZSH

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode)
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# needs to be after oh-my-zsh setup
# Enables zsh shell completion for kubectl
if type "$/usr/local/bin/kubectl" > /dev/null; then
  [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
fi
if type "$/usr/local/bin/helm" > /dev/null; then
  [[ /usr/local/bin/helm ]] && source <(helm completion zsh)
fi


if [ -f "$HOME/.private" ]; then
  source ~/.private
fi

source ~/.aliases

# Section: FZF
command -v fzf > /dev/null && eval "$(fzf --zsh)"

export CONDA_AUTO_ACTIVATE_BASE=false
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# Ruby
# TODO: choose rvm or rbenv and setup
command -v rbenv > /dev/null && eval "$(rbenv init - zsh)"
export PATH="$PATH:$HOME/.rbenv/shims"
# Add RVM to PATH for scripting.
# export PATH="$PATH:$HOME/.rvm/bin"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
command -v direnv > /dev/null && eval "$(direnv hook zsh)"

# Added by Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
