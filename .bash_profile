
export PS1="[\e[1;37m\u\e[0m@\e[1;37m\h\e[0m \e[1;37m\t\e[0m] \e[1;37m\w\e[0m \n$ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export MONGO_PATH=/usr/local/mongodb
export NPM_PATH=$HOME/npm
export GAE_PATH=$HOME/google_appengine
export YARN_PATH=$HOME/.yarn
# Put the npm path before usr/local
export PATH=$YARN_PATH/bin:$NPM_PATH/bin:$GAE_PATH:$PATH:$MONGO_PATH/bin
export PATH=$HOME/bin:$PATH

source "$HOME/.aliases"
source "$HOME/.bash_py"

# private tokens that do not get saved to repo
source "$HOME/.tokens"

### GIT CONFIGS

# git tab completion
# (must be installed via 'brew install git bash-completion'
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# makes pretty prompt in git repo directories
# 'brew install bash-git-prompt'
# https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

#source /usr/local/git/contrib/completion/git-completion.bash
GIT_PROMPT_ONLY_IN_REPO=1

 # added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/Users/patrick/npm/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh

# added by rvm
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patrick/google-cloud-sdk/path.bash.inc' ]; then source '/Users/patrick/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrick/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/patrick/google-cloud-sdk/completion.bash.inc'; fi
