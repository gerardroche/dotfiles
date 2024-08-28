# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

case "$PATH" in
    "$HOME/bin:"*) ;;
    *":$HOME/bin:"*) ;;
    *)
        # Store PATH to be appended last.
        __TMP_PATH__="$PATH"

        # 1. User's private bin.
        PATH="$HOME/bin-private"

        # 2. User's bin.
        PATH="$PATH:$HOME/bin"

        # 3. User's local bin.
        PATH="$PATH:$HOME/.local/bin"

        # Add original PATH last.
        PATH="$PATH:$__TMP_PATH__"
        unset __TMP_PATH__

        export PATH
        ;;
esac

if [ -f "$HOME/.profile-private" ]; then
    . "$HOME/.profile-private"
fi
