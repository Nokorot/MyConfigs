
# Prints the date ans time when a new bash profile is started
date

export PATH=$PATH:"/home/noko/.local/bin"
export PATH=$PATH:"/home/noko/.bin"

export VARS="$HOME/.vars/"

if [ -d ~/.bashrc.d ]; then
  for i in ~/.bashrc.d/*; do
    [ -r $i ] && source $i
  done
  unset i
fi

# This is for esting

alias mv="mv -i"


###

