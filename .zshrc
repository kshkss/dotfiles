# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/akishika/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

bindkey -e

export EDITOR=/usr/bin/vim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export npm_config_prefix=~/.local

path=(~/.local/bin ~/.cargo/bin $path)
fpath=(~/.zsh/completions $fpath)

if [[ $(command -v exa) ]]; then
	alias ls='exa --git'
fi

source ~/.zplug/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# enhance completions
zplug "zsh-users/zsh-completions"

# use 256 colors
zplug "chrissicool/zsh-256color"

# theme
#zplug "sindresorhus/pure", as:theme
#zplug 'benniemosher/the-one-theme', as:theme
#zplug 'dracula/zsh', as:theme
#ZSH_THEME="TheOne"
zplug 'yous/lime'

# settings about history
zplug "modules/history", from:prezto

# Then, source plugins and add commands to $PATH
zplug load

if command -v direnv > /dev/null; then
	eval " $(direnv hook zsh)"
fi
