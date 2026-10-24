# ghq cd
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}

eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

if command -v rustc >/dev/null 2>&1; then
	source "$(rustc --print sysroot)"/etc/bash_completion.d/cargo
fi

# Node.js
if command -v fnm > /dev/null 2>&1; then
	eval "$(fnm env --use-on-cd --shell bash)"
	eval "$(fnm completions --shell bash)"
	fnm use lts-latest
fi
if command -v npm > /dev/null; then
  npm config delete prefix
  npm config set min-release-age 15
fi
if command -v pnpm > /dev/null; then
	export PNPM_HOME="$HOME/.local/share/pnpm"
	if [ ! -e $PNPM_HOME ]; then
		mkdir -p $PNPM_HOME
	fi
	pnpm config set minimum-release-age 22000
fi
