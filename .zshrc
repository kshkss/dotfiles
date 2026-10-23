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

# Node.js
if command -v fnm > /dev/null; then
	eval "$(fnm env --use-on-cd --shell zsh)"
	fnm use lts-latest
fi
if command -v npm > /dev/null; then
  if [ ! -e "$HOME/.cache/npm" ]; then
	  mkdir -p "$HOME/.cache/npm"
	  npm config set prefix "$HOME/.cache/npm"
  fi
  npm config set min-release-age 15
  export PATH="$PATH:$HOME/.cache/npm/bin"
fi
if command -v pnpm > /dev/null; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	if [ ! -e $PNPM_HOME ]; then
		mkdir -p $PNPM_HOME
	fi
	export PATH="$PATH:$PNPM_HOME/bin"
	pnpm config set minimum-release-age 22000
fi

bw_unlock() {
  export BW_SESSION=$(bw unlock --raw)
}
