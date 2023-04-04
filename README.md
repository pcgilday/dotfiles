# dotfiles


## Setup General
- install homebrew https://brew.sh/
- `brew bundle`
- `code` to open vscode - turn on settings sync 
- install ohmyzsh https://ohmyz.sh/#install
  - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

## Setup neovim
- install vim-plug for neovim https://github.com/junegunn/vim-plug#neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
- `v dotfiles/.vimrc` & run :PlugInstall
  - v is aliased to neovim which was installed via brew
  - https://github.com/junegunn/vim-plug - plugin manager
    - plugins defined in .vimrc


## zsh

- uses zsh with oh-my-zsh, see .zshrc for config settings
- .zshrc sets path, loads plugins, and sources .aliases and .private

## neovim

- aliased to v
- .vimrc contains settings with comments and vim plug plugins

## git settings

- mostly rely on zsh git plugin with some aliases .aliases and .gitconfig 
- .gitconfig loads work specific .gitconfig for using preferred email for commits

## tmux 

don't really use tmux anymore, but leaving the config for now

## private

- sourced from zshrc when exists in ~/.private
- not in version control so it can contains api keys and other private information


