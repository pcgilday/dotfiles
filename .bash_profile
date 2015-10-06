export PS1="[\e[1;37m\u\e[0m@\e[1;37m\h\e[0m \e[1;37m\t\e[0m] \e[1;37m\w\e[0m \n=> "

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

#
alias git='hub'
