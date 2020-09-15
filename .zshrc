# Put user bin first
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:$HOME/.local/bin
export PATH="$HOME/.cargo/bin:$PATH"
# Add code (vscode) command to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Path to oh-my-zsh installation.
export ZSH="/Users/patrick/.oh-my-zsh"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  brew
  vi-mode
  osx
  web-search
  zsh-autosuggestions
)

# source other dotfiles
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases
source $HOME/.private

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
# This loads nvm bash_completion
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"

ZSH_THEME="robbyrussell"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/patrick/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/patrick/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/patrick/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/patrick/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



