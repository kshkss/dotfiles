# /etc/skel/.bash_profile

# pyenv configuration
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"

# opam configuration
test -r /home/akishika/.opam/opam-init/init.sh && . /home/akishika/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
