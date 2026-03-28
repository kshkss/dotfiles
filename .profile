# Python
export UV_EXCLUDE_NEWER="30 days"

# Node.js
if command -v npm > /dev/null; then
  if [ ! -e "$HOME/.cache/npm" ]; then
    mkdir -p "$HOME/.cache/npm"
    npm config set prefix "$HOME/.cache/npm"
  fi
  npm config set min-release-age 15
  export PATH="$PATH:$HOME/.cache/npm/bin"
fi

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$HOME/go/bin"
