# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi

PATH="$PATH:$HOME/.local/bin"

# opam configuration
test -r /home/akishika/.opam/opam-init/init.sh && . /home/akishika/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

