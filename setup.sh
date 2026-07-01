#!/usr/bin/env bash
# One-shot machine setup. Idempotent: safe to re-run.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() { printf '\n\033[1;34m==>\033[0m %s\n' "$1"; }

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Make brew available on PATH for the rest of this script (Apple Silicon).
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 2. oh-my-zsh (KEEP_ZSHRC so it won't create/overwrite our symlinked .zshrc)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing oh-my-zsh..."
  RUNZSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# 3. Symlink dotfiles into $HOME
info "Linking dotfiles..."
"$DOTFILES/link-files.sh"

# 4. Install Homebrew packages
info "Installing Homebrew packages (brew bundle)..."
brew bundle --file="$DOTFILES/Brewfile"

# 5. Pure prompt (loaded from ~/.zsh/pure by .zshrc)
if [ ! -d "$HOME/.zsh/pure" ]; then
  info "Installing Pure prompt..."
  git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
fi

# 6. tpm — tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  info "Installing tpm (tmux plugin manager)..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# 7. Vim plugins (vim-plug ships in .vim/autoload/plug.vim)
if command -v vim >/dev/null 2>&1; then
  info "Installing vim plugins..."
  vim +PlugInstall +qall || true
fi

info "Done! Start a fresh shell:  exec zsh"
echo "    (tmux plugins: launch tmux, then press prefix + I to install)"
