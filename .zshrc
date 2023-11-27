# Put user bin first
export PATH=$HOME/bin:/opt/homebrew/bin:$PATH
# export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
# Add code (vscode) command to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# why is this needed, should be linked to main brew bin?
export PATH="$PATH:/opt/homebrew/opt/postgresql@12/bin"
# export PATH=/Users/patrick.gilday/.pgo/pgo:$PATH

# Path to oh-my-zsh installation.
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi

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
plugins=(
  git
  # docker
  vi-mode
  # brew
  # osx
  # web-search
  # autosuggestions
)
ZSH_THEME="robbyrussell"
# # source last
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


# export FZF_DEFAULT_COMMAND='ag --hidden --ignore node_modules -g '
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Setting ag as the default source for fzf
# export FZF_DEFAULT_COMMAND='ag -g ""'



# This loads nvm bash_completion
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

export FZF_DEFAULT_COMMAND='ag --hidden --ignore node_modules -g '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/patrick.gilday/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/patrick.gilday/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/patrick.gilday/opt/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/patrick.gilday/opt/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patrick.gilday/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/patrick.gilday/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrick.gilday/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/patrick.gilday/google-cloud-sdk/completion.zsh.inc'; fi

# Ruby
# TODO: choose rvm or rbenv and setup
# eval "$(rbenv init - zsh)"
# export PATH="$PATH:$HOME/.rbenv/shims"
# Add RVM to PATH for scripting.
export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
eval "$(direnv hook zsh)"
