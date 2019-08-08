#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# cd + clear
function c() { [ ! -z "$1" ] && cd $1; clear && pp && ls; }

alias v="nvim"
alias r="ranger"

alias o="gio open"
alias rm="gio trash"
alias trash="gio trash"

alias qlatex="~/.bin/qlatex"
alias uniPrint="~/.bin/uniPrint"

alias xc="xclip -selection clipboard"
alias hl="/usr/share/vim/vim81/macros/less.sh"

alias gg="google-chrome-stable >/dev/null 2>&1 & disown"
function ga() { google-chrome --app="http://$1" 2>&1 & disown; }
function ee() { emacs "$@" > /dev/null & disown; }

alias mount="sudo mount"
alias umount="sudo umount"
alias shutdown="sudo shutdown" 

##
alias vi3="vim ~/.config/i3/config"
