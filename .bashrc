case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)

    # Git prompt settings (see /usr/lib/git-core/git-sh-prompt)
    GIT_PS1_DESCRIBE_STYLE="describe"
    GIT_PS1_SHOWCOLORHINTS="y"
    GIT_PS1_SHOWCONFLICTSTATE="y"
    GIT_PS1_SHOWDIRTYSTATE="y"
    GIT_PS1_SHOWSTASHSTATE="y"
    GIT_PS1_SHOWUNTRACKEDFILES="y"
    GIT_PS1_SHOWUPSTREAM="verbose name git"

    # Function to display prompt
    do_prompt_command() {
        local status=$?
        local suffix
        if [ "$status" -eq 0 ]; then
            suffix="\$"
        else
            suffix="\[\033[41;97m\]! $status\[\033[0m\]\n\$"
        fi
        __git_ps1 \
            "\[\033[32m\]\u@\h\[\033[0m\] \[\033[34m\]\w\[\033[0m\]" \
            "\n$suffix " \
            " (%s)"
    }

    PROMPT_COMMAND=do_prompt_command
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \$ '
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases-private ]; then
    . ~/.bash_aliases-private
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_functions-private ]; then
    . ~/.bash_functions-private
fi

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    if [ -f ~/.bash_completions ]; then
        . ~/.bash_completions
    fi

    if [ -f ~/.bash_completions-private ]; then
        . ~/.bash_completions-private
    fi
fi

export EDITOR=vim
export GPG_TTY="$(tty)"
export LESSHISTFILE=-
export SUDO_EDITOR="$EDITOR"

if [ -f ~/.bashrc-private ]; then
    . ~/.bashrc-private
fi
