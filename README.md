# dotfiles

Hi, I'm Gerard.

I'm a programmer and software developer.

My [website](https://www.gerardroche.com/?ref=github.com/gerardroche/dotfiles).

Follow me on [X](https://x.com/gerardroche_/?ref=www.gerardroche.com).

## What's included

- [Vim](https://github.com/vim/vim) - Vi IMproved, a programmer's text editor.
- [Git](https://www.git-scm.com/) - A distributed version control system.
- [Gitk](https://git-scm.com/docs/gitk) - The Git repository browser.

## Setup

Requires [Ubuntu 24.04](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview).

Clone to `~/.dotfiles`.

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

Run the install script.

```sh
cd ~/.dotfiles
./install
```

The installer can be run repeatedly. It will symlink the necessary files. Any existing files will be moved out of the way.

### Optional private files

Optional private files can be placed in `~/.dotfiles-private`:

```sh
~/.dotfile-private/.bash_aliases
~/.dotfile-private/.bash_completions
~/.dotfile-private/.bash_functions
~/.dotfile-private/.bashrc
~/.dotfile-private/.gitconfig
~/.dotfile-private/.profile
~/.dotfile-private/bin
```

If a private file exists it is symlinked into the home directory and sourced by the main files:

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

Some aliases:

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
