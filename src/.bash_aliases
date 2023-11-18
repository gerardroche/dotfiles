alias ...='cd ../..'
alias ..='cd ..'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias a='php artisan'
alias am='git add . && git commit --amend --reuse-message=HEAD'
alias ap='gap'
alias aptclean='sudo apt-get clean; sudo apt-get autoclean; sudo apt-get autoremove'
alias autoclean='sudo apt autoclean'
alias autoremove='sudo apt autoremove'
alias cb='git checkout -b'
alias cdd='cd ~/.dotfiles'
alias cddp='cd ~/.dotfiles-private'
alias cds='cd ~/.config/sublime-text/Packages && ls'
alias co='git checkout -b'
alias comp='composer -v'
alias compd="composer dump-autoload"
alias compi="composer -v install"
alias compo="composer outdated"
alias compr="composer -v require"
alias comps="composer show --latest"
alias compu='composer -v update'
alias compul='composer -v update --lock'
alias connections='sudo lsof -n -P -i +c 15'
alias copykey='command cat ~/.ssh/id_rsa.pub | pbcopy'
alias cpuinfo='lscpu'
alias cs='make cs'
alias csfix='php-cs-fixer fix'
alias d='gd'
alias db='git branch -d'
alias dbconsole='bin/dbconsole'
alias ds='gds'
alias e='vi'
alias ealiases='vi ~/.dotfiles/src/.bash_aliases'
alias ebashrc='vi ~/.dotfiles/src/.bashrc'
alias ecompletions='vi ~/.dotfiles/src/.bash_completions'
alias efunctions='vi ~/.dotfiles/src/.bash_functions'
alias egitconfig='vi ~/.dotfiles/src/.gitconfig'
alias egitexcludes='vi ~/.dotfiles/src/.gitexcludes'
alias ehosts="sudo -E vi /etc/hosts"
alias epaliases='vi ~/.dotfiles-private/src/.bash_aliases'
alias epbashrc='vi ~/.dotfiles-private/src/.bashrc'
alias epfunctions='vi ~/.dotfiles-private/src/.bash_functions'
alias esshconfig="vi ~/.ssh/config"
alias evimrc='vi ~/.dotfiles/src/.vimrc'
alias fk='gk'
alias g='git'
alias ga='git a'
alias gaa='git al'
alias gal='git al'
alias gamend='git amend'
alias gap='git ap'
alias garc='git add .; git rebase --continue'
alias gb='git b'
alias gc='git c'
alias gca='git ca'
alias gcam='git cam'
alias gcb='git checkout -b'
alias gci='git ci'
alias gclean='git clean -dxf'
alias gcm='git cam'
alias gconext='git conext'
alias gcoprev='git coprev'
alias gcp='git cherry-pick --no-commit'
alias gcv='git cv'
alias gd='git d'
alias gdc='git dc'
alias gds='git ds'
alias gdw='git dw'
alias gf='git f'
alias gff70='git merge --ff-only upstream/PHP-7.0'
alias gff71='git merge --ff-only upstream/PHP-7.1'
alias gff72='git merge --ff-only upstream/PHP-7.2'
alias gff73='git merge --ff-only upstream/PHP-7.3'
alias gff74='git merge --ff-only upstream/PHP-7.4'
alias gff='git merge --ff-only'
alias gffnext='git ffnext'
alias gffod='git merge --ff-only  origin/develop'
alias gffom='git merge --ff-only  origin/master'
alias gffum='git merge --ff-only upstream/master'
alias gfg='git fetch gerardroche'
alias gfo='git fetch origin'
alias gfu='git fetch upstream'
alias gk='gk_default&'
alias gka='gitk --all&'
alias gkb='gk_branches&'
alias gl='git l'
alias gla='git la'
alias gll='git ll'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls='git ls'
alias gm="git m"
alias gmod='git merge --ff-only origin/develop'
alias gmom='git merge --ff-only origin/master'
alias go70='git checkout PHP-7.0'
alias go71='git checkout PHP-7.1'
alias go72='git checkout PHP-7.2'
alias go73='git checkout PHP-7.3'
alias go74='git checkout PHP-7.4'
alias go='git checkout'
alias god='git checkout develop'
alias gom='git checkout master'
alias got='git'
alias gp='git pull'
alias gpff='git pull --ff-only'
alias gpffg='git pull --ff-only gerardroche'
alias gpffo='git pull --ff-only origin'
alias gpffp='git pull --ff-only --prune'
alias gpffu='git pull --ff-only upstream'
alias gpop='git stash pop'
alias gprune='git fetch --prune'
alias gpt='git push --tags'
alias gpwt='git push && git push --tags'
alias gr='git reset'
alias gra='git rebase --abort'
alias grb='git rebase'
alias grc='git rebase --continue'
alias grd='git rebcase dev'
alias grh='git reset --hard'
alias gri='git rebase -i'
alias griom='git rebase -i origin/master'
alias grv='git remote -v'
alias gs='git s'
alias gsl='git stash list'
alias gsta='git stash save --include-untracked'
alias gt='git t'
alias gtypist='gtypist -b -q'
alias gundo='git reset --soft HEAD^'
alias gw='git w'
alias gwa='USE_DIST=y git wa'
alias gzap='git zap'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig | awk '/inet addr/{print substr($2,6)}'"
alias jbuild='bundle exec jekyll build --strict-front-matter'
alias jserve='bundle exec jekyll serve --strict-front-matter'
alias k='gk'
alias l='ls -AlFhv'
alias logmondebug='logmon --debug'
alias logmoninfo='logmon --info'
alias lsgitaliases='cat ~/.bash_aliases | grep "^alias g"; cat ~/.bash_aliases-private | grep "^alias g";git aliases'
alias md='mkd'
alias meminfo='free -m -l -t'
alias netstatls='netstat -ltpauW'
alias o='git open'
alias p='phpunit --no-coverage'
alias pcov='phpunit --coverage-html build/coverage'
alias pop='gpop'
alias pp='phpunit'
alias ppp='phpunit --coverage-html build/coverage-full'
alias ppv='phpunit --path-coverage --strict-coverage -c phpunit.strict.xml'
alias push='git push'
alias q='exit'
alias rebaseandcontinue='git add . && git rebase --continue'
alias reloadaliases="source ~/.bash_aliases && source ~/.bash_aliases-private"
alias reloadbashrc='source ~/.bashrc'
alias reloadcompletions="source ~/.bash_completions"
alias reloadfunctions="source ~/.bash_functions && source ~/.bash_functions-private"
alias reloadnvm='source ~/.nvm/nvm.sh && nvm use'
alias s='gs'
alias se='sudo -E vi'
alias sports='sudo netstat -lntpauW'
alias sta='gsta'
alias svi='sudo -E vi'
alias tmr="tmuxrenamewindow"
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade -V --show-upgraded'
alias vhalt="vagrant halt"
alias vkill="vagrant destroy"
alias vsus="vagrant suspend"
alias vup="vagrant up"
alias w='USE_DIST=y git w'
alias wa='USE_DIST=y git wa'
alias wp='USE_DIST=y git w :pencil:'
alias wpencil='USE_DIST=y git w :pencil:'
alias wur='USE_DIST=y git w Update README'
alias zap='git zap'
