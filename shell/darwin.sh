# shell/darwin.sh — macOS-only config sourced by BOTH zsh and bash.
# POSIX-friendly (no zsh/bash-only syntax here).

# ---- Homebrew + platform PATH -------------------------------------------
export PATH="/opt/homebrew/bin:$PATH"
# VS Code CLI
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# postgresql@12 client tools
export PATH="$PATH:/opt/homebrew/opt/postgresql@12/bin"

# ---- asdf (brew-installed) ----------------------------------------------
[ -f /opt/homebrew/opt/asdf/libexec/asdf.sh ] && . /opt/homebrew/opt/asdf/libexec/asdf.sh

# ---- nvm (brew-installed) -----------------------------------------------
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# ---- macOS aliases -------------------------------------------------------
# Get macOS software updates, update Homebrew and its packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup'
alias brewup='brew update; brew upgrade; brew cleanup'

# ctags (Homebrew's, not the BSD one shipped with macOS)
alias ctags="/opt/homebrew/bin/ctags"
# Regenerate ctags for a Ruby project
retag() {
  /opt/homebrew/bin/ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=node_modules .
  echo "Tags regenerated!"
}
