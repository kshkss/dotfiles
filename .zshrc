setopt share_history

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

if [[ ! -e ~/.cache/npm ]]; then
  mkdir -p ~/.cache/npm
  npm config set prefix ~/.cache/npm
fi
export PATH=$PATH:$HOME/.cache/npm/bin
export PATH=$PATH:$HOME/go/bin

# ghq cd
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}

export UV_EXCLUDE_NEWER="30 days"
