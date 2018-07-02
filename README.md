# dotfiles

My configuration files for bash, vim, git, and more. :zap: :zap:

![Screenshot](screenshot.png)

## Installation

**All bets are off! Install at your own risk.**

The dotfiles must be cloned to `~/.dotfiles` or some things might break!

```sh
git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

Run the installer.

It will install dependencies, submodules, and setup any necessary symbolic
links (or in WSL the files are copied into place because symlinks are mangled in WSL).

**On Linux, it will not overwrite anything.** If the installer can't create a
symlink because an existing file or folder already exists, it will print a
notice asking you to move the file out of the way and re-run the installer.

On WSL the files **will** overwrite existing files.

```
~/.dotfiles/install
```

Open Vim and run `:PlugInstall` to install the vim dependencies. Vim may
complain about missing colorschemes, once the dependencies are installed it will
be fine.

## Thanks

* https://gist.github.com/XVilka/8346728
* https://github.com/AntJanus/dotfiles
* https://github.com/garybernhardt/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/mislav/dotfiles
* https://github.com/paulirish/dotfiles
* https://github.com/pengwynn/dotfiles
* https://github.com/r00k/dotfiles
* https://github.com/samholman/dotfiles
* https://github.com/skwp/dotfiles
* https://github.com/matthewmccullough/scripts
* https://github.com/matthewmccullough/dotfiles
* http://vimcasts.org
* https://bitbucket.org/sjl/dotfiles
* http://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
* https://blog.scottnonnenberg.com/better-git-configuration

&lt;3
