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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # Default PS1 (when Git is not used)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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
        __git_ps1 "\[\033[34m\]\w\[\033[0m\] " "\n\$(if [ \$? -eq 0 ];then printf \"\$\";else printf \"\[\033[41;97m\][\$?] ✘ Error \[\033[0m\]\n\$\";fi) " "%s"
    }

    PROMPT_COMMAND=do_prompt_command
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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
