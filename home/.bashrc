
zsh && exit


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

export TERMIANL_BG=#222222


###

_nn_complete() {
    pushd $NOTES >/dev/null
    _longopt $@
    popd >/dev/null
}
complete -o filenames -F _nn_complete nn

_new_complete() {
    [ $COMP_CWORD -eq 1 ] || return
    pushd "$HOME/Templates" >/dev/null
    COMPREPLY=($(compgen -f -X ".[^./]*"))
    popd >/dev/null
}
complete -F _new_complete new

_nb_complete() {
    local file; for file in $NOTEBOOK_DIR/"$2"*; do
        COMPREPLY+=( $(basename "${file%.md}") )
    done
}
complete -F _nb_complete nb

