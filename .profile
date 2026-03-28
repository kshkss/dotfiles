# Python
export UV_EXCLUDE_NEWER="30 days"

# Node.js
if command -v pnpm > /dev/null; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	if [ ! -e $PNPM_HOME ]; then
		mkdir -p $PNPM_HOME
	fi
	pnpm config set minimum-release-age 22000
	export PATH="$PATH:$PNPM_HOME"
fi
if command -v npm > /dev/null; then
  npm config set min-release-age 15
fi

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Go
export PATH="$PATH:$HOME/go/bin"
