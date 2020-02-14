#!/bin/sh
# Profile file. Runs on login

#Needed for conecting to the uni-cloud-print, not in use at the moment
export CUPS_USER="s1706798" 

export FILE="ranger"
export TERMINAL="tilix" # "urxvt" # "tabbed-st" Trubels with i3 window selection
export BROWSER="google-chrome" # "brave-browser"
export EDITOR="nvim"

export URXVT_PERL_LIB=$HOME/.config/urxvt/ext


# Spesial i3 workspace names
source ~/.config/i3/gen-files/ws-names.sh

[ -f "$HOME/.Xresources" ] && xrdb ~/.Xresources

if [ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ]; then
   . "$HOME/.bashrc"
fi

add2path() {
	[ -d $1 ] && export PATH="$PATH:$1"
}
add2pathRec() {
	[ -d $1 ] && export PATH="$PATH:$(du $1 | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
}

add2path ~/.bin/
add2path ~/.local/bin/

add2pathRec $HOME/.scripts/

add2path ~/.local/bin

