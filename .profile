# Python
export UV_EXCLUDE_NEWER="30 days"

# Node.js
export PNPM_HOME="$HOME/.local/share/pnpm"
if [ ! -e $PNPM_HOME ]; then
	mkdir -p $PNPM_HOME
fi
export PATH="$PATH:$PNPM_HOME"
if command -v pnpm > /dev/null; then
	pnpm config set minimum-release-age 22000
fi

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$HOME/go/bin"
