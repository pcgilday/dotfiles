# dotfiles

## zsh

- uses zsh with oh-my-zsh, see .zshrc for config settings
- .zshrc sets path, loads plugins, and sources .aliases and .private

## vim

- .vimrc contains settings with comments and vim plug plugins

## git settings

- mostly rely on zsh git plugin with some aliases .aliases and .gitconfig 
- .gitconfig loads work specific .gitconfig for using preferred email for commits

## tmux 

don't really use tmux anymore, but leaving the config for now


## private

- .private is not in version control as it contains api keys and other private information, but it
  is sourced from zshrc
