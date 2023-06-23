#!/bin/sh
# Profile file. Runs on login

source ~/.uservars

export SUDO_ASKPASS="/home/noko/.bin/rofi-askpass.sh"

[ -f "$HOME/.Xresources" ] && xrdb ~/.Xresources
