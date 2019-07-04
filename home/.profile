# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="$PATH:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export FILE="ranger"
export TERMINAL="st" # "tabbed-st" Trubels with i3 window selection
export BROWSER="google-chrome"
export BRIGHTNESS=70

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	   . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Switch escape and caps 
# sudo -n loadkeys ~/.bin/ttymaps.knap 2>/dev/null
# wal -Rn >/dev/null

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01f1f1f" #black          
    echo -en "\e]P8d6dbe5" #darkgrey
    echo -en "\e]P1f81118" #darkred
    echo -en "\e]P9de352e" #red
    echo -en "\e]P22dc55e" #darkgreen
    echo -en "\e]PA1dd361" #green
    echo -en "\e]P3ecba0f" #brown
	echo -en "\e]PBf3bd09" #yellow
	echo -en "\e]P42a84d2" #darkblue
    echo -en "\e]PC1081d6" #blue
    echo -en "\e]P54e5ab7" #darkmagenta
    echo -en "\e]PD5350b9" #magenta
    echo -en "\e]P61081d6" #darkcyan
    echo -en "\e]PE0f7ddb" #cyan
    echo -en "\e]P7d6dbe5" #lightgrey
    echo -en "\e]PFffffff" #white
	clear #for background artifacting
fi

