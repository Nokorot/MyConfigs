#!/bin/sh
# Profile file. Runs on login

#Needed for conecting to the uni-cloud-print, not in use at the moment
export CUPS_USER="s1706798" 

export FILE="ranger"
export TERMINAL="urxvt" # "tabbed-st" Trubels with i3 window selection
export BROWSER="google-chrome"
export EDITOR="nvim"

export URXVT_PERL_LIB=$HOME/.config/urxvt/ext


[ -f "$HOME/.Xresources" ] && xrdb ~/.Xresources

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	   . "$HOME/.bashrc"
    fi
fi

add2path() {
	[ -d $1 ] && PATH="$PATH:$1"
}
add2pathRec() {
	[ -d $1 ] && PATH="$PATH:$(du $1 | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
}

add2path $HOME/.bin/
add2path $HOME/.local/bin/

add2pathRec $HOME/.scripts/


