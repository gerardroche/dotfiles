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

# No less history (~/.lesshst file)
export LESSHISTFILE=-

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

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

    GIT_PS1_DESCRIBE_STYLE="describe"
    GIT_PS1_SHOWCOLORHINTS="y"
    GIT_PS1_SHOWDIRTYSTATE="y"
    GIT_PS1_SHOWSTASHSTATE="y"
    GIT_PS1_SHOWUNTRACKEDFILES="y"
    GIT_PS1_SHOWUPSTREAM="verbose name git"

    PS1_VERSION_COLOR="\[\e[37m\]"
    PS1_VERSION_LABEL_COLOR="\[\e[38m\]"
    PS1_PWD_COLOR="\[\e[34m\]"
    PS1_ERROR_COLOR="\[\e[31m\]"
    PS1_CLEAR_COLOR="\[\e[0m\]"

    do_prompt_command() {
        last_status=$?
        ver_info=""

        # # PHP
        # if test -f composer.json; then
        #     php_version=$(php -v 2>&1 | grep --color=never -oe "^PHP\s*[0-9.]\+" | awk '{print $2}')
        #     ver_info="${ver_info} ${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}${PS1_VERSION_COLOR}${php_version}${PS1_CLEAR_COLOR}${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}"
        # fi

        # # NODE
        # if test -f package.json; then
        #     if test "x$PWD" != "x$PS1_PREV_PWD"; then
        #         if test -f .nvmrc; then
        #             nvm use
        #         fi
        #     fi

        #     npm_version=$(npm --version 2>/dev/null)
        #     ver_info="${ver_info}/${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}${PS1_VERSION_COLOR}${npm_version}${PS1_CLEAR_COLOR}${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}"

        #     node_version=$(node -v 2>/dev/null | sed -e 's/v//')
        #     ver_info="${ver_info}/${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}${PS1_VERSION_COLOR}${node_version}${PS1_CLEAR_COLOR}${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}"
        # fi

        # Ruby
        # if test -f Gemfile; then
        #     ruby_version=$(rbenv version-name)
        #     ver_info="${ver_info}${PS1_VERSION_LABEL_COLOR}ruby${PS1_CLEAR_COLOR}  ${PS1_VERSION_COLOR}${ruby_version}${PS1_CLEAR_COLOR}${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}"

        #     # Rails
        #     if test -f bin/rails; then
        #         rails_version=$(rails --version | sed -e 's/Rails //')
        #         ver_info="${ver_info}/${PS1_VERSION_LABEL_COLOR}rails ${PS1_CLEAR_COLOR}${PS1_VERSION_COLOR}${rails_version}${PS1_CLEAR_COLOR}${PS1_VERSION_LABEL_COLOR}${PS1_CLEAR_COLOR}"
        #     fi
        # fi

        PS1_PREV_PWD="$PWD"

        # Format versions.
        if test -n "$ver_info"; then
            ver_info=" $(echo "$ver_info" | sed -e 's/ //')"
        fi

        __git_ps1 "${PS1_PWD_COLOR}╭─ \w${PS1_CLEAR_COLOR}$ver_info " \
                  "\n${PS1_PWD_COLOR}╰─${PS1_CLEAR_COLOR}$(if test $last_status = 0;then echo "${PS1_PWD_COLOR}\$${PS1_CLEAR_COLOR}";else echo "${PS1_ERROR_COLOR} 💥${PS1_CLEAR_COLOR}";fi) " \
                  "(%s)"
    }

    PROMPT_COMMAND=do_prompt_command
    # PROMPT_COMMAND='__git_ps1 "╭─ \w" "\n╰$(if test $? = 0;then echo "\$";else echo "\[\e[31m\]\$\[\e[0m\]";fi) " " ⎇  %s"'

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

# Function definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_functions, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
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

    # Enable custom programmable completion features.
    # You may want to put all your additions into a separate file like
    # ~/.bash_completions, i
    if [ -f ~/.bash_completions ]; then
        . ~/.bash_completions
    fi
fi

# If running nvm.
if [ -n "$NVM_DIR" ]; then
    if [ -f "$NVM_DIR/nvm.sh" ]; then
        . "$NVM_DIR/nvm.sh" --no-use
    fi
fi

# Fix CTRL-S in Vim.
# https://stackoverflow.com/questions/13648237/ctrls-horizontal-split-not-working-with-command-t-in-vim
stty start undef stop undef

# Customisations.
if [ -f ~/.bashrc-private ]; then
    . ~/.bashrc-private
fi
