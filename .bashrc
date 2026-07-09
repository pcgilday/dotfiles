# .bashrc — portable loader. Resolves this file's own directory (following
# symlinks) so it works wherever the repo is cloned. Sources, in order:
#   shell/common.sh  -> shell/<platform>.sh  -> bash/common.bash -> bash/<platform>.bash
_src="${BASH_SOURCE[0]}"
while [ -h "$_src" ]; do
  _dir="$(cd -P "$(dirname "$_src")" >/dev/null 2>&1 && pwd)"
  _src="$(readlink "$_src")"
  case "$_src" in /*) ;; *) _src="$_dir/$_src" ;; esac
done
DOTFILES="$(cd -P "$(dirname "$_src")" >/dev/null 2>&1 && pwd)"
unset _src _dir

[ -f "$DOTFILES/shell/common.sh" ] && . "$DOTFILES/shell/common.sh"
case "$(uname -s)" in
  Darwin) [ -f "$DOTFILES/shell/darwin.sh" ] && . "$DOTFILES/shell/darwin.sh" ;;
  Linux)  [ -f "$DOTFILES/shell/linux.sh" ]  && . "$DOTFILES/shell/linux.sh"  ;;
esac

[ -f "$DOTFILES/bash/common.bash" ] && . "$DOTFILES/bash/common.bash"
case "$(uname -s)" in
  Darwin) [ -f "$DOTFILES/bash/darwin.bash" ] && . "$DOTFILES/bash/darwin.bash" ;;
  Linux)  [ -f "$DOTFILES/bash/linux.bash" ]  && . "$DOTFILES/bash/linux.bash"  ;;
esac
