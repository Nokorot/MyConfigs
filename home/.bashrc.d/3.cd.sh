#!/bin/bash

function pp() { echo -e "\033[03;34m$(pwd)\033[00m"; }

# Add logging and ls to cd.
mkdir -p "/tmp/cdlogs"
cdlogfile="/tmp/cdlogs/$BASHPID"
function cd() {
	loc=$(pwd)
	if [ "$1" == "_" ]; then
		builtin cd "$( tail -n 1 $cdlogfile )";
		sed -i '$d' $cdlogfile;
	else
		builtin cd "$@"; 
		[ "$loc" != "$(pwd)" ] && echo "$loc" >> $cdlogfile;
	fi
	[ "$loc" != "$(pwd)" ] && pp
}
