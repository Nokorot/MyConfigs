#!/bin/sh
# streamlink -p "mpv --no-audio --wid=$1" https://www.youtube.com/watch?v=-M8u4jaCCJs best

mpv --loop=inf --no-audio --wid="$1" /home/noko/.vbg
