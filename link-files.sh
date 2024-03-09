#!/bin/bash

ln -s "$HOME/dotfiles/.aliases" "$HOME/.aliases"
ln -s "$HOME/dotfiles/.editorconfig" "$HOME/.editorconfig"
ln -s "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -s "$HOME/dotfiles/.gitignore-global" "$HOME/.gitignore-global"
ln -s "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
ln -s "$HOME/dotfiles/.vim" "$HOME/.vim"
ln -s "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
# Put nvim dir in .config (linux/mac)
ln -s "$HOME/dotfiles/nvim" "$HOME/.config/nvim"
# ln -s "$HOME/dotfiles/.zprofile" "$HOME/.zprofile "

