# Download Znap, if it's not there yet.
[[ -f ~/.cache/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.cache/zsh-snap

source ~/.cache/zsh-snap/znap.zsh  # Start Znap

# `znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete

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
export PATH=$HOME/.cache/npm/bin:$PATH
