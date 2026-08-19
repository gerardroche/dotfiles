# dotfiles

My personal configuration files for Bash, Git, and Vim.

## What's included

- [Vim](https://github.com/vim/vim)
- [Git](https://www.git-scm.com/)
- [Gitk](https://git-scm.com/docs/gitk)

## Setup

Requires [Ubuntu 24.04](https://ubuntu.com/desktop).

Clone the repository:

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

Run the installer:

```sh
cd ~/.dotfiles && ./install
```

The installer moves existing files out of the way so the installer can be run repeatedly.

Updates use the installer:

```sh
cd ~/.dotfiles && git pull --ff-only && ./install
```

## Private dotfiles

Private files are optional and can be placed in your own private dotfiles at `~/.dotfiles-private/`.

When private dotfiles exist, they are symlinked into place by appending "-private" and included by the main dotfiles:

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

## Aliases

### Editing

| Alias                 | Description |
| --------------------- | ----------- |
| ealiases              | Edit `.bash_aliases` |
| ebashrc               | Edit `.bashrc` |
| ecompletions          | Edit `.bash_completions` |
| efunctions            | Edit `.bash_functions` |
| egitconfig            | Edit `.gitconfig` |
| epaliases             | Edit `.bash_aliases-private` |
| epbashrc              | Edit `.bashrc-private` |
| epcompletions         | Edit `.bash_completions-private` |
| epfunctions           | Edit `.bash_functions-private` |

### Reloading

| Alias                 | Description |
| --------------------- | ----------- |
| reloadaliases         | Reload `.bash_aliases` and `.bash_aliases-private` |
| reloadbashrc          | Reload `.bashrc` and `.bashrc-private` |
| reloadcompletions     | Reload `.bash_completions` and `.bash_completions-private` |
| reloadfunctions       | Reload `.bash_functions` and `.bash_functions-private` |
