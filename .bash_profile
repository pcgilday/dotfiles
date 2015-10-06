
#source /usr/local/git/contrib/completion/git-completion.bash
GIT_PROMPT_ONLY_IN_REPO=1

export PS1="[\e[1;37m\u\e[0m@\e[1;37m\h\e[0m \e[1;37m\t\e[0m] \e[1;37m\w\e[0m \n$ "

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export MONGO_PATH=/usr/local/mongodb
export NPM_PATH=/Users/patrick/npm
#Put the npm path in front (before usr/local)
export PATH=$NPM_PATH/bin:$PATH:$MONGO_PATH/bin

# git tab completion (must be installed via 'brew install git bash-completion'
if [ -f $(brew --prefix)/etc/bash_completion ]; then
 . $(brew --prefix)/etc/bash_completion
fi

# makes pretty prompt in git repo directories
# 'brew install bash-git-prompt' https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

#
alias git='hub'
