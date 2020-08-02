#!/bin/sh
# Profile file. Runs on login

export FILE="ranger"
export TERMINAL="urxvt"  # "tilix" # "urxvt" # "st"
export BROWSER="google-chrome" # "chrome" # "brave-browser"
export EDITOR="nvim"


# ~/ Clean-up:
export URXVT_PERL_LIB=$HOME/.config/urxvt/ext
export XAUTHORTY="$XDG_RUNTIME_DIR/Xauthority"
export LESSHISTFILE="-"
export SPACEMACSDIR="$HOME/.local/share/spacemacs"

# TODO: Move
export backlight_screen='acpi_video0'

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


export PATH="$HOME/.cargo/bin:$PATH"
