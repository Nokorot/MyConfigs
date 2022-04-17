#!/bin/sh
# Profile file. Runs on login

source ~/.uservars
[ -f "$HOME/.Xresources" ] && xrdb ~/.Xresources
