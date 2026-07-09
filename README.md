# dotfiles

A constantly evolving set of configurations. Cross-platform (macOS / Linux)
and cross-shell (zsh / bash).

## Layout

Config is split along two axes — **shell** and **platform** — so the right
pieces load wherever the repo is cloned. Each shell's rc file is a thin loader
that resolves its own directory and sources fragments in order:

```
shell/
  common.sh      # POSIX-sh: sourced by BOTH zsh and bash, on ALL platforms
  darwin.sh      # POSIX-sh: both shells, macOS only (homebrew, asdf, nvm, mac aliases)
  linux.sh       # POSIX-sh: both shells, Linux only
zsh/
  common.zsh     # zsh only, all platforms (fzf, rs)
  darwin.zsh     # zsh only, macOS (pure prompt, oh-my-zsh, conda, completions)
bash/
  common.bash    # bash only, all platforms (fzf, rs)
git/common.gitconfig     tmux/common.tmux.conf     vim/{vimrc,common.vim,autoload/}
.zshrc  .bashrc          # loaders (source the fragments above)
.editorconfig  .gitignore-global
link-files.sh  setup.sh  Brewfile
```

Load order per shell: `shell/common.sh` → `shell/<platform>.sh` →
`<shell>/common.<ext>` → `<shell>/<platform>.<ext>`. Every source is
existence-guarded, so absent fragments are harmless.

## macOS setup

- clone this repo into the home directory (e.g. `~/dotfiles`)
- `cd ~/dotfiles && ./setup.sh`

`setup.sh` is idempotent (safe to re-run) and handles everything:

- installs [homebrew](https://brew.sh/) and [oh-my-zsh](https://ohmyz.sh/#install) if missing
- symlinks the dotfiles into `$HOME` (via `link-files.sh`)
- `brew bundle` to install packages from the Brewfile
- installs the [Pure](https://github.com/sindresorhus/pure) zsh prompt (loaded from `~/.zsh/pure`)
- installs [tpm](https://github.com/tmux-plugins/tpm) for tmux plugins
- installs vim plugins (`:PlugInstall`)

## Linux / cross-platform setup

The repo works on Linux under either shell. `setup.sh` is macOS-specific
(Homebrew), so on Linux install tools with your package manager and run just
the linker:

```sh
git clone https://github.com/pcgilday/dotfiles ~/dotfiles
cd ~/dotfiles && ./link-files.sh
```

`link-files.sh` refreshes existing symlinks and skips real files without
clobbering them. On Linux the shell loaders skip all the macOS-only fragments
(homebrew, pure, oh-my-zsh, conda), so nothing errors out. Add Linux-specific
config to `shell/linux.sh` (either shell) or `bash/common.bash` / `zsh/common.zsh`.

## Vim

- `vim/vimrc` uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management
- run `:PlugInstall` (setup.sh does this automatically)
- uses fzf and ag, so those should be installed

## zsh

- macOS uses oh-my-zsh + the Pure prompt (see `zsh/darwin.zsh`)
- `.zshrc` is a loader; portable zsh config lives in `zsh/common.zsh`

## bash

- `.bashrc` is a loader mirroring `.zshrc`; portable bash config lives in `bash/common.bash`

## private

- `~/.private` is sourced from `shell/common.sh` when it exists
- not in version control, so it can contain API keys and other private information
