# Gerard's dotfiles

- Website: [www.gerardroche.com](https://www.gerardroche.com)
- X: [@gerardroche_](https://x.com/gerardroche_)

## Setup

You need [Ubuntu 24.04](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

Clone or download the dotfiles to `~/.dotfiles` and run the install script.

The installer can be run repeatedly; existing files will be backed up.

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install
```

### Optional private dotfiles

Setup optional private dotfiles in a separate repository at `~/.dotfiles-private`. The following are supported.

```sh
~/.dotfile-private/.bash_aliases
~/.dotfile-private/.bash_completions
~/.dotfile-private/.bash_functions
~/.dotfile-private/.bashrc
~/.dotfile-private/.gitconfig
~/.dotfile-private/.profile
~/.dotfile-private/bin
```

If private dotfiles exist, they are symlinked to the home directory by the installer and sourced by the main dotfiles.

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

There are several related aliases to reload various bash files:

```sh
reloadaliases
reloadbashrc
reloadcompletions
reloadfunctions
```

And aliases to edit bash files:

```sh
ealiases
ebashrc
ecompletions
efunctions
epaliases
epbashrc
epcompletions
epfunctions
```
