# zsh/darwin.zsh — zsh-only config, macOS only.

# ---- Pure prompt (installed to ~/.zsh/pure by setup.sh) ------------------
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# ---- oh-my-zsh -----------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
# Standard plugins live in ~/.oh-my-zsh/plugins/*; custom in ~/.oh-my-zsh/custom/plugins/
plugins=(vi-mode)
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# ---- Completions (must come after oh-my-zsh) -----------------------------
if type "$/usr/local/bin/kubectl" > /dev/null; then
  [[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
fi
if type "$/usr/local/bin/helm" > /dev/null; then
  [[ /usr/local/bin/helm ]] && source <(helm completion zsh)
fi

# ---- conda ---------------------------------------------------------------
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
