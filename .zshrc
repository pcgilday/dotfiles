# Put user bin first
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
# Add code (vscode) command to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# why is this needed, should be linked to main brew bin?
# Add RVM to PATH for scripting. 
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:/usr/local/Cellar/postgresql@12/12.6_2/bin"
export PATH=/Users/patrick.gilday/.pgo/pgo:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source $HOME/.aliases
source $HOME/.private

# env maybe move to .zshenv
export KUBECONFIG=${HOME}/.kube/config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin


# Setup NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# OHMYZSH

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  # brew
  vi-mode
  # osx
  # web-search
  # autosuggestions
)
ZSH_THEME="robbyrussell"
# source last
source $ZSH/oh-my-zsh.sh

# needs to be after oh-my-zsh setup
# Enables zsh shell completion for kubectl
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)



export FZF_DEFAULT_COMMAND='ag --hidden --ignore node_modules -g '
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

