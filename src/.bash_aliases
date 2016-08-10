
use_shorthand_alias() {
    echo >&2 "alias: use shorthand dumb dumb: $1"
    return 1
}

alias ...='cd ../..'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias appconsole='./vendor/bin/appconsole'
alias cc='c' # typo
alias ccd='cd' # typo
alias ccdd='cd' # typo
alias cdd='cd' # typo
alias cds='cd ~/.config/sublime-text-3/Packages'
alias cl='use_shorthand_alias ctrl+l"'
alias cpuinfo='lscpu'
alias d='git diff'
alias dbtasks='./vendor/bin/dbtasks'
alias e='vi'
alias ealiases='vi ~/.bash_aliases'
alias ehosts="sudo vi /etc/hosts"
alias eldehosts="lde hosts edit --default"
alias eprojecthosts="lde hosts edit"
alias fk='gk' # typo
alias g='git'
alias ga='git add'
alias gal='git add .'
alias gap='git add -p'
alias gb='git branch -v -a'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gd='use_shorthand_alias d'
alias gf='git fetch -v'
alias gffo='git merge --ff-only origin/master'
alias gk='use_shorthand_alias k'
alias gls='git ls'
alias gm='git merge'
alias go='git checkout'
alias gom='git checkout master'
alias gp='git push'
alias gpt='git push && git push --tags'
alias gr='git remote -v'
alias gs='use_shorthand_alias s'
alias gup='git fetch && git rebase'
alias k='gitk --all&'
alias l='ls -AlFhv'
alias la='ls -Ah'
alias lc='ls -CFh'
alias ll='use_shorthand_alias l'
alias meminfo='free -m -l -t'
alias o='git-open'
alias p='phpunit'
alias ports='netstat -lntpau'
alias q='exit'
alias reload-bashrc='source ~/.bashrc'
alias s='git status'
alias save='use_shorthand_alias wa'
alias tmux='tmux -2'
alias top='top -o %CPU'
alias update='sudo apt-get update'
alias upgrade='sudo apt-get upgrade -V --show-upgraded'
alias vi='nvim'
alias vv='v' # typo
alias wa='git w'
