# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# Check that we are not in a Tmux session before populating PATH. This works
# around Tmux duplicating PATH entries every time a Tmux session is created.
# http://unix.stackexchange.com/questions/4965/keep-duplicates-out-of-path-on-source/4973#4973
# http://unix.stackexchange.com/questions/124444/how-can-i-cleanly-add-to-path/124447#124447
if test -z "$TMUX"; then

    # The original path will be appended to new entries.
    ORIG_PATH="$PATH"

    case "$PATH" in
        "$HOME/bin:"*)
            # Path has already been updated!
            ;;
        *)

            # User first!
            PATH="$HOME/bin"

            # PHP
            PATH="$PATH:$HOME/.config/composer/vendor/bin"

            # NPM
            PATH="$PATH:$HOME/npm/bin"

            # Ruby
            PATH="$PATH:$HOME/.rbenv/shims"
            PATH="$PATH:$HOME/.rbenv/bin"
            PATH="$PATH:$HOME/.gems/bin"

            # Python
            PATH="$PATH:$HOME/.pyenv/shims"
            PATH="$PATH:$HOME/.pyenv/bin"

            # Local
            PATH="$PATH:$HOME/.local/bin"

            # Append original.
            PATH="$PATH:$ORIG_PATH"
            ;;
    esac

    export PATH

    unset ORIG_PATH
fi

export EDITOR=vi

export GPG_TTY=$(tty)

# Make sure nvm dir path is resolved if it's a symlink.
# Fixes "When NVM_DIR is a symlink nvm_ls breaks"
# https://github.com/creationix/nvm/issues/617
export NVM_DIR="$(readlink -nf ~/.nvm)"

# NPM
export NPM_CONFIG_FUND=false

# Python
export PYENV_ROOT="$(readlink -nf ~/.pyenv)"

# Ruby
# Fix Gem issue (I can't remember exactly what the issue was)
unset GEM_HOME

# Private.
if [ -f ~/.profile-private ]; then
    . ~/.profile-private
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# I want nvm node to be available globally. In order for this to work, nvm must
# be loaded at startup, but also when bash or tmux session starts, see bashrc.
if test -z "$TMUX"; then
    # If running nvm, load it.
    if [ -n "$NVM_DIR" ]; then
        if [ -s "$NVM_DIR/nvm.sh" ]; then
            . "$NVM_DIR/nvm.sh"
        fi
    fi
fi
