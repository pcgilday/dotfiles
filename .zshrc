# .zshrc — portable loader. Resolves this file's own directory (following
# symlinks) so it works wherever the repo is cloned. Sources, in order:
#   shell/common.sh  -> shell/<platform>.sh  -> zsh/common.zsh -> zsh/<platform>.zsh
DOTFILES="${${(%):-%x}:A:h}"

[ -f "$DOTFILES/shell/common.sh" ] && source "$DOTFILES/shell/common.sh"
case "$(uname -s)" in
  Darwin) [ -f "$DOTFILES/shell/darwin.sh" ] && source "$DOTFILES/shell/darwin.sh" ;;
  Linux)  [ -f "$DOTFILES/shell/linux.sh" ]  && source "$DOTFILES/shell/linux.sh"  ;;
esac

[ -f "$DOTFILES/zsh/common.zsh" ] && source "$DOTFILES/zsh/common.zsh"
case "$(uname -s)" in
  Darwin) [ -f "$DOTFILES/zsh/darwin.zsh" ] && source "$DOTFILES/zsh/darwin.zsh" ;;
  Linux)  [ -f "$DOTFILES/zsh/linux.zsh" ]  && source "$DOTFILES/zsh/linux.zsh"  ;;
esac
