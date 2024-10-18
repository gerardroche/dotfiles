# Gerard's dotfiles

- Website: [www.gerardroche.com](https://www.gerardroche.com)
- X: [@gerardroche_](https://x.com/gerardroche_)

## What's included

- [git](https://www.git-scm.com/) - A distributed version control system.
- [gitk](https://git-scm.com/docs/gitk) - The Git repository browser.

## Setup

You need [Ubuntu 24.04](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

Clone or download the dotfiles to `~/.dotfiles` and run the install script.

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && ./install
```

The installer will:

- install the included software
- symlink the necessary dotfiles

The installer can be run repeatedly; blocking files will be backed up.

### Optional private dotfiles

Setup optional private dotfiles in a separate repository at `~/.dotfiles-private`.

```sh
~/.dotfile-private/.bash_aliases
~/.dotfile-private/.bash_completions
~/.dotfile-private/.bash_functions
~/.dotfile-private/.bashrc
~/.dotfile-private/.gitconfig
~/.dotfile-private/.profile
~/.dotfile-private/bin
```

If a private dotfile exists it will be symlinked into the home directory by the installer and sourced by the main dotfiles.

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

Here are some related aliases to reload and edit dotfiles.

| Alias                 | Description |
| --------------------- | ----------- |
| reloadaliases         | Reload `.bash_aliases` and `.bash_aliases-private` |
| reloadbashrc          | Reload `.bashrc` and `.bashrc-private` |
| reloadcompletions     | Reload `.bash_completions` and `.bash_completions-private` |
| reloadfunctions       | Reload `.bash_functions` and `.bash_functions-private` |
| ealiases              | Edit `.bash_aliases` |
| ebashrc               | Edit `.bashrc` |
| ecompletions          | Edit `.bash_completions` |
| efunctions            | Edit `.bash_functions` |
| egitconfig            | Edit `.gitconfig` |
| epaliases             | Edit `.bash_aliases-private` |
| epbashrc              | Edit `.bashrc-private` |
| epcompletions         | Edit `.bash_completions-private` |
| epfunctions           | Edit `.bash_functions-private` |
```
