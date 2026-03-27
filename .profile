# Python
export UV_EXCLUDE_NEWER="30 days"

# Node.js
if [ ! -e "$HOME/.cache/npm" ]; then
  mkdir -p "$HOME/.cache/npm"
  npm config set prefix "$HOME/.cache/npm"
fi
export PATH="$PATH:$HOME/.node/bin"
export PATH="$PATH:$HOME/.cache/npm/bin"

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$HOME/go/bin"
