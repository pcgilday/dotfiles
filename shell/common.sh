# shell/common.sh — portable shell config sourced by BOTH zsh and bash on ALL
# platforms. Keep everything here POSIX-friendly (bash/zsh compatible); put
# shell-specific bits in zsh/ or bash/, and platform-specific bits in
# shell/darwin.sh or shell/linux.sh.

# ---- PATH ----------------------------------------------------------------
# User bins first, then cargo, then ~/.local/bin. Platform dirs (e.g.
# homebrew) are added in shell/darwin.sh.
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"

# ---- Go ------------------------------------------------------------------
export GOPATH="$HOME/go"
export GOBIN="$HOME/bin"
export PATH="$PATH:$GOPATH/bin"

# ---- Kubernetes ----------------------------------------------------------
export KUBECONFIG="${HOME}/.kube/config"

# ---- Editor --------------------------------------------------------------
# Default editor for git, `hermes config edit`, and the Hermes /prompt
# compose command (which opens $VISUAL, falling back to $EDITOR).
export EDITOR="vim"
export VISUAL="vim"

# ---- nvm (generic; brew-installed nvm is wired up in shell/darwin.sh) -----
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ---- Private / machine-local overrides (not tracked) ---------------------
[ -f "$HOME/.private" ] && . "$HOME/.private"

# ---- Aliases -------------------------------------------------------------
# Reload the shell config (shell-specific `rs` lives in zsh/ and bash/).
alias v='vim'
alias vimrc='vim ~/.vimrc'
alias cs='claude-swarm'
alias cl='clear'
alias toolbox='cd ~/repos/toolbox'
alias be='bundle exec'
alias ta='tmux a'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

## git
alias g="git"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gb="git branch"
alias ga="git add"
alias gai="git add --patch --interactive"
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd="git diff"
alias gdc="git diff --cached"
alias gl="git pull"
alias glr="git pull --rebase"
alias gf="git fetch"
alias gp="git push"
alias gs="git status -sb"
alias gcp="git cherry-pick"
alias gg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci)%Creset %C(cyan)%an%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn --no-merges"
alias gw="git whatchanged"
alias gchurn="git log --pretty="format:" --name-only | grep -vE '^(vendor/|$)' | sort | uniq -c | sort"
alias gcherry="git log --left-right --graph --cherry-pick --oneline" # master...feature

## python
alias ca='conda activate'

## node
alias ys='yarn start'

## docker
alias d='docker'
alias dc='docker compose'

## k8s
alias k='kubectl'
alias kcg='k config get-contexts'

## go
alias gorun='go run -mod=vendor'
alias gobuild='go build -mod=vendor'

## rust
alias gocargo='go build && go run'
alias cb='cargo build'
alias cr='cargo run'
