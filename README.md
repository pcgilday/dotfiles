# dotfiles

A constantly evolving set of configurations. 


## Mac OS Setup

This relies on [homebrew](https://brew.sh/) and [oh-my-zsh](https://github.com/junegunn/vim-plug), which should be installed first.

- clone this repo into home directory
- cd ~/dotfiles
- `brew bundle`
- `./link-files.sh` - will symlink files into home directory (fails if files already exist)

## Linux Setup

Much of this should work on linux, but my current daily driver is a mac. When I do setup linux a linux machine it I generally clone the repo and manually link the bits I need. Sometimes I fix settings to be cross platform and push those up.

## Vim / Neovim 

I am currently experimenting with neovim after years of using vim. 

- common.vim is sourced by both vim and neovim
- .vimrc is vim specific and uses [vim-plug](https://github.com/junegunn/vim-plug)
- nvim/init.lua sets up lazy.nvim and nvim plugins

## zsh

- using oh-my-zsh because it's a pretty good set of defaults and I'm lazy
- .zshrc sets path, loads plugins, and sources .aliases and .private

## tmux

- using [tpm](https://github.com/tmux-plugins/tpm) for plugin management


## private

- sourced from zshrc when exists in ~/.private
- not in version control so it can contains api keys and other private information


