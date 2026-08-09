# Install
Run Makefile
```
make install
```

# Dependencies
## Binaries
* zsh
* tig
* tmux
* neovim
* fzf

## Zsh extensions
* zsh-autocomplete
* zsh-autosuggestions

## Binaries for neovim plugins
* python-pynvim
* nodejs, npm, and neovim
* ripgrep
* tree-sitter-cli
* lua 5.1 and luarocks

## LSP
* rust-analyzer
* clangd
* gopls
* templ
* lua-language-server
* pyright
* ruff

## Language servers
### C/C++
```bash
pacman -S clang
```

### Rust
```bash
rustup component add rust-analyzer
```

### Python
```bash
uv tool install ruff
uv tool install pyright
```

### Lua
```bash
pacman -S lua-language-server
```
