# Gerard's dotfiles

- Website: [www.gerardroche.com](https://www.gerardroche.com)
- X: [@gerardroche_](https://x.com/gerardroche_)

## What's included

- [Vim](https://github.com/vim/vim) - Vi IMproved, a programmer's text editor.
- [Git](https://www.git-scm.com/) - A distributed version control system.
- [GitK](https://git-scm.com/docs/gitk) - The Git repository browser.

## Setup

Requires [Ubuntu 24.04](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

Clone or download to `~/.dotfiles`.

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

Run the install script.

```sh
cd ~/.dotfiles
./install
```

This will:

- Install the software like Vim, Git, Gitk.
- Symlink the necessary files. Any existing files will be moved out of the way.

The installer can be run repeatedly.

### Optional private dotfiles

Optional private dotfiles can be placed in `~/.dotfiles-private`:

```sh
~/.dotfile-private/.bash_aliases
~/.dotfile-private/.bash_completions
~/.dotfile-private/.bash_functions
~/.dotfile-private/.bashrc
~/.dotfile-private/.gitconfig
~/.dotfile-private/.profile
~/.dotfile-private/bin
```

If a private dotfile exist they are symlinked into the home directory and sourced by the main dotfiles:

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

Some aliases to edit and reload various dotfiles:

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
