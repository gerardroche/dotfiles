reloadaliases() {
    source ~/.bash_aliases
    [ -f ~/.bash_aliases-private ] && source ~/.bash_aliases-private
}

reloadbashrc() {
    source ~/.bashrc
}

reloadcompletions() {
    source ~/.bash_completions
    [ -f ~/.bash_completions-private ] && source ~/.bash_completions-private
}

reloadfunctions() {
    source ~/.bash_functions
    [ -f ~/.bash_functions-private ] && source ~/.bash_functions-private
}
