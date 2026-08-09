[ -f "$HOME/.profile" ] && emulate sh -c ". $HOME/.profile"

fpath=(~/.zsh/completions $fpath)

export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export MOZC_IBUS_CANDIDATE_WINDOW=ibus

