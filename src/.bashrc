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
HISTSIZE=1000
HISTFILESIZE=2000

# No less history
export LESSHISTFILE=-

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

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

    # Set to "yes" to enable
    oh_my_git_prompt=

    # hook it to my veins
    GIT_PS1_DESCRIBE_STYLE="contains"
    GIT_PS1_SHOWCOLORHINTS="y"
    GIT_PS1_SHOWDIRTYSTATE="y"
    GIT_PS1_SHOWSTASHSTATE="y"
    GIT_PS1_SHOWUNTRACKEDFILES="y"
    GIT_PS1_SHOWUPSTREAM="verbose name git"

    if [ "$oh_my_git_prompt" = yes ]; then

        PS1="\w `test $? = 0 && echo "\$" || echo "\[\033[41m\]\[\033[30m\]\$\[\033[0m\]"` "

        : ${omg_is_a_git_repo_symbol:='⎇  '}
        : ${omg_has_untracked_files_symbol:='%'}
        : ${omg_has_adds_symbol:=''}
        : ${omg_has_deletions_symbol:='-'}
        : ${omg_has_cached_deletions_symbol:='-'}
        : ${omg_has_modifications_symbol:='~'}
        : ${omg_has_cached_modifications_symbol:='~'}
        : ${omg_ready_to_commit_symbol:='⭢'}
        : ${omg_is_on_a_tag_symbol:='=T'}
        : ${omg_needs_to_merge_symbol:='=M'}
        : ${omg_detached_symbol:='⭫'}
        : ${omg_can_fast_forward_symbol:='⯭'} # ⮅
        : ${omg_has_diverged_symbol:='⭷'}
        : ${omg_not_tracked_branch_symbol:=''}
        : ${omg_rebase_tracking_branch_symbol:='RTB'}
        : ${omg_merge_tracking_branch_symbol:='⮃'}
        : ${omg_should_push_symbol:='⭡'}
        : ${omg_has_stashes_symbol:='HS'}

        oh_my_git_prompt="$(dirname "$(dirname "$(readlink -nf "${BASH_SOURCE[0]}")")")/vendor/arialdomartini/oh-my-git/prompt.sh"

        if test -f "$oh_my_git_prompt"; then
            . "$oh_my_git_prompt"
        fi
    else
        prompt_command_callback() {
            if test "$?" = 0; then
                prompt_char="\$"
            else
                prompt_char="\[\033[41m\]\[\033[30m\]\$\[\033[0m\]"
            fi

            # void __git_ps1 {pre} {post} {git info}
            __git_ps1 "╭─ \w " "\n╰$prompt_char " "\\u2387\\u0020\\u0020%s"
        }

        PROMPT_COMMAND="prompt_command_callback"
    fi

    unset oh_my_git_prompt

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

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

# If this is an xterm set the title to user@host:dir
# Note: This is commented out because it prevents the
# title being set via the title() function. See the
# functions definition file: bash_functions.
# case "$TERM" in
#     xterm*|rxvt*)
#         PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#         ;;
#     *)  ;;
# esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# Enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then

    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi

    # Enable custom programmable completion features.
    # You may want to put all your additions into a separate file like
    # ~/.bash_completions, i
    if [ -f ~/.bash_completions ]; then
        . ~/.bash_completions
    fi
fi

# Fix CTRL-S is Vim.
# https://stackoverflow.com/questions/13648237/ctrls-horizontal-split-not-working-with-command-t-in-vim
stty start undef stop undef
