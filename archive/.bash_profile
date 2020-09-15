
##############################
# BASH PROMPT
##############################
prompt_git() {
    local s='';
    local branchName='';

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == '0' ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null;

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+='+';
            fi;

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+='!';
            fi;

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+='?';
            fi;

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+='$';
            fi;

        fi;

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
        echo '(unknown)')";

        [ -n "${s}" ] && s=" [${s}]";

        echo -e "${1}${branchName}${2}${s}";
    else
        return;
    fi;
}

reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";

# PS1="[\e[1;37m\u\e[0m@\e[1;37m\h\e[0m \e[1;37m\t\e[0m] \e[1;37m\w\e[0m \n$ "
PS1="["
PS1+="${white}\t" # time
PS1+=" ${white}\u" # username
PS1+="${reset}@"
PS1+="${white}\h" # host
PS1+=" ${cyan}\w" # working dir
PS1+="${reset}]"
PS1+="\$(prompt_git \"\[${white}\] \[${violet}\]\" \"\[${blue}\]\")"; # Git repository details

PS1+="${reset}\n$ " # `$` (and reset color)
export PS1

##########################
# end bash prompt
##########################

##########################
# PATH
##########################
export PYENV_ROOT=$HOME/.pyenv

# Add GAE to front of path
export PATH=$HOME/google_appengine:$PATH
# Put the yarn/npm before usr/local (and yarn before npm)
export PATH=$HOME/.yarn/bin:$HOME/npm/bin:$HOME/npm/n/bin:$PATH
# python local path
export PATH=$HOME/.local/bin:$PATH
# pyenv local path
export PATH=$PYENV_ROOT/bin:$PATH
# Put user bin first
export PATH=$HOME/bin:$PATH
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Add code (vscode) command to path
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Set N prefix - https://github.com/tj/n#additional-details
# related to $HOME/npm/n/bin
export N_PREFIX=$HOME/npm

###################################
# python config
###################################
export PYTHON_LOCAL=$HOME/.local
export PIP_USER=yes # default pip to install in ~/.local

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


##########################################################
# Below are auto added by tooling
##########################################################


if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
