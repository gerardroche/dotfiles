# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

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

    # Default PS1
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

    # See /usr/lib/git-core/git-sh-prompt
    GIT_PS1_DESCRIBE_STYLE="describe"
    GIT_PS1_SHOWCOLORHINTS="y"
    GIT_PS1_SHOWCONFLICTSTATE="y"
    GIT_PS1_SHOWDIRTYSTATE="y"
    GIT_PS1_SHOWSTASHSTATE="y"
    GIT_PS1_SHOWUNTRACKEDFILES="y"
    GIT_PS1_SHOWUPSTREAM="verbose name git"

    # https://gkarthiks.github.io/quick-commands-cheat-sheet/bash_command.html
    # https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
    PSC_C="\[\033[0m\]"       # clear
    PSC_W="\[\033[34m\]"      # cwd
    PSC_E="\[\033[41;30m\]"   # error
    PSC_P="\[\033[34m\]"      # prompt

    do_prompt_command() {
        __git_ps1 "$PSC_W\w$PSC_C " "\n\$(if [ \$? == 0 ];then echo \"$PSC_P❯$PSC_C\";else echo \"$PSC_E❯$PSC_C\";fi) " "%s"
    }

    PROMPT_COMMAND=do_prompt_command
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# NOTE: This is commented out because it prevents the title being set via the
# title() function. See the functions definition file: bash_functions.
# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_aliases-private ]; then
    . ~/.bash_aliases-private
fi

# Function definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/.bash_functions-private ]; then
    . ~/.bash_functions-private
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then

    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    # Enable custom programmable completion features. You may want to put all
    # your additions into a separate file like ~/.bash_completions.

    if [ -f ~/.bash_completions ]; then
        . ~/.bash_completions
    fi

    if [ -f ~/.bash_completions-private ]; then
        . ~/.bash_completions-private
    fi
fi

export EDITOR=vi
export GPG_TTY=$(tty)
export LESSHISTFILE=-
export SUDO_EDITOR="$EDITOR"

if [ -f ~/.bashrc-private ]; then
    . ~/.bashrc-private
fi
