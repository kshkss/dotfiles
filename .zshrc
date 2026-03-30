setopt share_history

autoload -Uz compinit
compinit -u

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# ghq cd
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

if command -v fnm > /dev/null 2>&1; then
	eval "$(fnm env --use-on-cd --shell zsh)"
	eval "$(fnm completions --shell zsh)"
	fnm default lts-latest
fi
if command -v npm > /dev/null; then
  npm config set min-release-age 15
fi
