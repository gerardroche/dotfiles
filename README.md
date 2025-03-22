# dotfiles

Hi, I'm Gerard.

I'm a programmer and software developer.

My [website](https://www.gerardroche.com/?ref=github.com/gerardroche/dotfiles).

Follow me on [X](https://x.com/gerardroche_/?ref=www.gerardroche.com).

## What's included

- [Vim](https://github.com/vim/vim)
- [Git](https://www.git-scm.com/)
- [Gitk](https://git-scm.com/docs/gitk)

## Setup

Requires [Ubuntu 24.04](https://ubuntu.com/desktop).

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

```sh
cd ~/.dotfiles
```

```sh
./install
```

Existing files in the way will be moved out of the way. The installer can be run repeatedly.

### Private files (optional)

Private files can be placed in `~/.dotfiles-private/`.

If private files exist they are symlinked in the home directory and sourced by the main files:

```sh
~/.dotfile-private/.bash_aliases -> ~/.bash_aliases-private
~/.dotfile-private/.bash_completions -> ~/.bash_completions-private
~/.dotfile-private/.bash_functions -> ~/.bash_functions-private
~/.dotfile-private/.bashrc -> ~/.bashrc-private
~/.dotfile-private/.gitconfig -> ~/.gitconfig-private
~/.dotfile-private/.profile -> ~/.profile-private
~/.dotfile-private/bin -> ~/bin-private
```

#### Editing

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

#### Reloading

| Alias                 | Description |
| --------------------- | ----------- |
| reloadaliases         | Reload `.bash_aliases` and `.bash_aliases-private` |
| reloadbashrc          | Reload `.bashrc` and `.bashrc-private` |
| reloadcompletions     | Reload `.bash_completions` and `.bash_completions-private` |
| reloadfunctions       | Reload `.bash_functions` and `.bash_functions-private` |
