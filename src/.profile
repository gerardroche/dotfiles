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

    # The original path will be appended to new entries.
    ORIG_PATH="$PATH"

    case "$PATH" in
        # Path has already been updated!
        "$HOME/bin:"*)
            ;;
        *)

            # User first!
            PATH="$HOME/bin"

            # PHP: Composer global packages.
            PATH="$PATH:$HOME/.config/composer/vendor/bin"

            # NPM
            PATH="$PATH:$HOME/npm/bin"

            # Ruby
            PATH="$PATH:$HOME/.rbenv/shims"
            PATH="$PATH:$HOME/.rbenv/bin"
            PATH="$PATH:$HOME/.gems/bin"

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
export PROJECTS_PATH=~/projects
export VENDOR_PATH=~/vendor
export GPG_TTY=$(tty)
export PHAN_DISABLE_XDEBUG_WARN=1
export XDEBUG_CONFIG="idekey=netbeans-xdebug"

# If you don't need BC kept on CLI level, you might use PHP_CS_FIXER_FUTURE_MODE
# to start using options that would be default in next MAJOR release.
# https://github.com/FriendsOfPhp/PHP-CS-Fixer
export PHP_CS_FIXER_FUTURE_MODE=1

# Make sure nvm dir path is resolved if it's a symlink.
# Fixes "When NVM_DIR is a symlink nvm_ls breaks"
# https://github.com/creationix/nvm/issues/617
export NVM_DIR="$(readlink -nf ~/.nvm)"

export NPM_CONFIG_AUDIT=1

# Use the alias "reloadnvm" when you want to use nvm, this avoids having to load
# nvm every time a shell is started. The "reloadnvm" alias has the advantage of
# executing "nvm use" after nvm is loaded to select any local npm version.
# if test -s "$NVM_DIR/nvm.sh"; then
#     . "$NVM_DIR/nvm.sh"
# fi

# Fix Gem issue (I can't remember exactly what the issue was)
unset GEM_HOME

