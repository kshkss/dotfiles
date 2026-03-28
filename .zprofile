[ -f "$HOME/.profile" ] && emulate sh -c ". $HOME/.profile"

fpath=(~/.zsh/completions $fpath)
