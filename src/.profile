# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Check that we are not in a Tmux session before populating PATH. This works
# around Tmux duplicating PATH entries every time a Tmux session is created.
# http://unix.stackexchange.com/questions/4965/keep-duplicates-out-of-path-on-source/4973#4973
# http://unix.stackexchange.com/questions/124444/how-can-i-cleanly-add-to-path/124447#124447
if test -z "$TMUX"; then

    # The default original path (it will be appended to the new entries).
    ORIG_PATH="$PATH"

    case "$PATH" in
        "$HOME/bin:"*)
            ;;
        *)
            PATH="$HOME/bin"
            PATH="$PATH:$HOME/.config/composer/vendor/bin"
            PATH="$PATH:$HOME/npm/bin"
            PATH="$PATH:$HOME/.rbenv/shims"
            PATH="$PATH:$HOME/.rbenv/bin"
            PATH="$PATH:$HOME/.gems/bin"
            PATH="$PATH:$HOME/.local/bin"
            PATH="$PATH:$ORIG_PATH"
            ;;
    esac

    export PATH

    unset ORIG_PATH
fi

export EDITOR=vi
export GPG_TTY=$(tty)
export NVM_DIR="$(readlink -nf ~/.nvm)" # Fix https://github.com/creationix/nvm/issues/617
export PHAN_DISABLE_XDEBUG_WARN=1
export PROJECTS_PATH=~/projects
export VENDOR_PATH=~/vendor
export XDEBUG_CONFIG="idekey=netbeans-xdebug"

unset GEM_HOME  # Fix Gem issue (I can't remember exactly what the issue was)

