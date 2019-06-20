#!/bin/bash

export PATH=$PATH:"/home/noko/.local/bin"
export PATH=$PATH:"/home/noko/.bin"

#PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$' sDefault
PS1='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$'

function o(){
	for i in "$@"; do
	   gio open "$i"
	done
}

alias lm="ll -dhG *"

alias trash="gio trash"
alias rm="gio trash"
alias qlatex="~/.bin/qlatex"
alias uniPrint="~/.bin/uniPrint"
alias xc="xclip -selection clipboard"
alias hl="/usr/share/vim/vim80/macros/less.sh"

alias gg="google-chrome >/dev/null 2>&1 & disown"

alias r="ranger"

# $(python ~/.bin/rstring.py)
# date +"%T"
cdlogfile_tag=$(($(date +%s%N)/1000000))
cdlogfile=~/.cache/cdlogs/$cdlogfile_tag

# pwd;
function cd(){
	# Change from file to array, or preferabley a stack 
	# http://tldp.org/LDP/abs/html/arrays.html

	if [ "$1" == "_" ]; then
		builtin cd $( tail -n 1 $cdlogfile ); pwd; ls;
		sed -i '$ d' $cdlogfile
	else
		loc=$(pwd);	
		builtin cd "$@"; 
		if [ "$loc" != "$(pwd)" ]; then
			pwd; ls;
			echo "$loc" >> $cdlogfile;
		fi
	fi
}
