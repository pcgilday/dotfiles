
##############################
# BASH PROMPT
##############################

export PS1="[\e[1;37m\u\e[0m@\e[1;37m\h\e[0m \e[1;37m\t\e[0m] \e[1;37m\w\e[0m \n$ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


##########################
# PATH
##########################

# Put the yarn/npm before usr/local (and yarn before npm)
export PATH=$HOME/.yarn/bin:$HOME/npm/bin:$PATH
# Add GAE to front of path
export PATH=$HOME/google_appengine:$PATH
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Put user bin first
export PATH=$HOME/bin:$PATH

###################################
# python config
###################################
export PYTHON_LOCAL=$HOME/.local
export PYTHON_CONFIGURE_OPTS="--enable-framework"

source "$HOME/.aliases"
# any private config that should not get saved to repo
source "$HOME/.private"

###################################################
# bash completion and other completion goodies
###################################################

# Add tab completion for many Bash commands (including git)
# (must be installed via `brew install bash-completion`
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	complete -o default -o nospace -F _git g;
fi;

# makes pretty prompt in git repo directories
# 'brew install bash-git-prompt'
# https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

# source /usr/local/git/contrib/completion/git-completion.bash
GIT_PROMPT_ONLY_IN_REPO=1

 # added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/Users/patrick/npm/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh



##########################################################
# Below are auto added by tooling
##########################################################

# added by rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/patrick/google-cloud-sdk/path.bash.inc' ]; then source '/Users/patrick/google-cloud-sdk/path.bash.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/patrick/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/patrick/google-cloud-sdk/completion.bash.inc'; fi
