#!/bin/sh

[ -z "$BRIGHTNES_CURVE" ] && BRIGHTNES_CURVE="1.0"


cat $HOME/.config/compton/fshader.glsl \
    | sed "s/BRIGHTNES_CURVE/$BRIGHTNES_CURVE/"
    
