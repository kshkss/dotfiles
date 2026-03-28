# ghq cd
cdrepo() {
  local repodir=$(ghq list | fzf -1 +m) && cd $(ghq root)/$repodir
}

eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"

if command -v rustc >/dev/null 2>&1; then
	source "$(rustc --print sysroot)"/etc/bash_completion.d/cargo
fi
