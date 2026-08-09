setopt share_history

autoload -Uz compinit
compinit -u
USE_POWERLINE="true"
source /usr/share/zsh/plugins/zsh-autocomplete
source /usr/share/zsh/plugins/zsh-autosuggestions

# ghq cd
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

if command -v npm > /dev/null; then
  if [ ! -e "$HOME/.cache/npm" ]; them
	  mkdir -p "$HOME/.cache/npm"
	  npm config set prefix "$HOME/.cache/npm"
  fi
  npm config set min-release-age 15
  export PATH="$PATH:$HOME/.cache/npm/bin"
fi
