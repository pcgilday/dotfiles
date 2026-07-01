#!/usr/bin/env bash
# Symlink dotfiles into the home directory. Safe to re-run:
# refreshes existing symlinks, skips real files (won't clobber them).
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1" dest="$2"
  if [ -L "$dest" ]; then
    ln -sfn "$src" "$dest"
    echo "  relinked: $dest"
  elif [ -e "$dest" ]; then
    echo "  skip:     $dest exists and is not a symlink"
  else
    ln -s "$src" "$dest"
    echo "  linked:   $dest"
  fi
}

link ".aliases"          "$HOME/.aliases"
link ".editorconfig"     "$HOME/.editorconfig"
link ".gitconfig"        "$HOME/.gitconfig"
link ".gitignore-global" "$HOME/.gitignore-global"
link ".vimrc"            "$HOME/.vimrc"
link ".vim"              "$HOME/.vim"
link ".zshrc"            "$HOME/.zshrc"
link ".tmux.conf"        "$HOME/.tmux.conf"
