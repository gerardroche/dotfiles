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

if test -z "$TMUX"; then

    # Check to see if we are in tmux before populating PATH. This is a hack to
    # prevent tmux from duplicating PATH entries.
    # Further reading:
    # http://unix.stackexchange.com/questions/4965/keep-duplicates-out-of-path-on-source/4973#4973
    # http://unix.stackexchange.com/questions/124444/how-can-i-cleanly-add-to-path/124447#124447

    # The default original path on Ubuntu looks something like:
    # /usr/local/sbin
    # /usr/local/bin
    # /usr/sbin
    # /usr/bin
    # /sbin
    # /bin
    # /usr/games
    # /usr/local/games
    # /snap/bin
    TMP_PATH="$PATH"

    case "$PATH" in
        "$HOME/bin:"*)
            ;;
        *)
            PATH="$HOME/bin"
            PATH="$PATH:$HOME/npm/bin"
            PATH="$PATH:$HOME/.rbenv/shims"
            PATH="$PATH:$HOME/.rbenv/bin"
            PATH="$PATH:$TMP_PATH"
            ;;
    esac

    export PATH

    unset TMP_PATH
fi

export EDITOR=vi
export PROJECTS_PATH=~/projects
export VENDOR_PATH=~/vendor
export XDEBUG_CONFIG="idekey=pugdebug"
