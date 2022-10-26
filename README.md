# dotfiles

My configuration files for bash, vim, git, and more. :zap: :zap:

## Installation

**Install at your own risk. All bets are off!**

The dotfiles must be cloned to `~/.dotfiles`:

```sh
$ git clone https://github.com/gerardroche/dotfiles.git ~/.dotfiles
```

Next, run the installer.

The installer will install **dependencies** and setup various symbolic links to the dotfile configurations and scripts.

**If a symbolic link cannot be created, e.g. because an existing file or folder already exists, it will be skipped and a message will printed. If you want the symbolic link then move the file out of the way and re-run the installer.**

```sh
$ ~/.dotfiles/install
```

Next, install the Vim dependencies: open Vim and run `:PlugInstall`.

*Vim may complain about missing colorschemes, you can ignore the message: once the dependencies are installed the error will go away.*

## Thanks

* http://vimcasts.org
* https://bitbucket.org/sjl/dotfiles
* https://blog.scottnonnenberg.com/better-git-configuration
* https://gist.github.com/XVilka/8346728
* https://github.com/AntJanus/dotfiles
* https://github.com/Firewall/dotfiles
* https://github.com/garybernhardt/dotfiles
* https://github.com/holman/dotfiles
* https://github.com/mathiasbynens/dotfiles
* https://github.com/matthewmccullough/dotfiles
* https://github.com/matthewmccullough/scripts
* https://github.com/mislav/dotfiles
* https://github.com/paulirish/dotfiles
* https://github.com/pengwynn/dotfiles
* https://github.com/r00k/dotfiles
* https://github.com/samholman/dotfiles
* https://github.com/skwp/dotfiles
* https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html

&lt;3
