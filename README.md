# dotfiles

A constantly evolving set of configurations. 


## Mac OS Setup

- clone this repo into the home directory
- `cd ~/dotfiles`
- `./setup.sh`

`setup.sh` is idempotent (safe to re-run) and handles everything:

- installs [homebrew](https://brew.sh/) and [oh-my-zsh](https://ohmyz.sh/#install) if missing
- symlinks the dotfiles into `$HOME` (via `link-files.sh`)
- `brew bundle` to install packages from the Brewfile
- installs the [Pure](https://github.com/sindresorhus/pure) zsh prompt (loaded from `~/.zsh/pure`)
- installs [tpm](https://github.com/tmux-plugins/tpm) for tmux plugins
- installs vim plugins (`:PlugInstall`)

`link-files.sh` can also be run on its own; it refreshes existing symlinks and skips real files without clobbering them.

## Linux Setup

Much of this should work on linux, but my current daily driver is a mac. When I do setup linux a linux machine it I generally clone the repo and manually link the bits I need. Sometimes I fix settings to be cross platform and push those up.

## Vim

- .vimrc uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- run `:PlugInstall` (setup.sh does this automatically)

This setup uses fzf and ag, so those should be installed (included in Brewfile if on MacOS)

## zsh

- using oh-my-zsh because it's a pretty good set of defaults and I'm lazy
- .zshrc sets path, loads plugins, and sources .aliases and .private

## tmux

- using [tpm](https://github.com/tmux-plugins/tpm) for plugin management


## private

- sourced from zshrc when exists in ~/.private
- not in version control so it can contains api keys and other private information


