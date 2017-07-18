#!/usr/bin/env bash

# Load RVM, if you are using it
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# Add rvm gems and nginx to the path
export PATH=$PATH:~/.gem/ruby/1.8/bin:/opt/nginx/sbin:~/git/code_swarm/bin:/Users/${USER}/Library/Android/sdk/platform-tools
export DFHOME=/Users/jasonkrol/dfrepos

export CODESWARM_DIR="/Users/jasonkrol/git/code_swarm"

# Path to the bash it configuration
export BASH_IT=$HOME/.bash_it

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='bobby'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Set the path nginx
export NGINX_PATH='/opt/nginx'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$HOME/go/bin
export PW_HOME=/Users/jasonkrol/go/src/github.com/pietrojs/paywhatevs
export PW_ENV=dev
export PATH=$PATH:$GOBIN

alias vi='vim'

alias gs='git status -sb'
alias gcm='git checkout master'
alias gc-='git checkout -'
alias gf='git fetch'
alias gp='git pull'
alias c='clear'
alias gb='git branch'
alias gbr='git branch --sort committerdate'
alias gl='git l'
alias gsu='git submodule update --recursive'
alias gd='git diff'
alias gnuke='git branch --merged | xargs git branch -d'
alias forcepull='git fetch ; git reset --hard @{u}'
alias dfpr='open https://github.com/DramaFever/playstation/compare/$(git rev-parse --abbrev-ref HEAD)?expand=1'
alias bowerflush='rm -rf bower_components && bower i'
alias awsps='aws s3 ls s3://dramafever.static-dev/playstation/'

alias dateR="python -c 'from email.Utils import formatdate; print formatdate(localtime=True)'"
alias vtop="vtop --theme dark"
alias localip="ifconfig | grep broadcast"

alias ls='ls -aG'
alias l='clear; ls -aGl'

LSCOLORS="Exfxcxdxbxegedabagacad"
export LSCOLORS

alias ..='cd ..'

alias psqlup='postgres -D /usr/local/var/postgres'

paywhatevs=~/go/src/github.com/pietrojs/paywhatevs

alias keys='ssh-add -A'

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh


#export DOCKER_HOST=tcp://192.168.59.107:2376
#export DOCKER_TLS_VERIFY=1
#export DOCKER_CERT_PATH=/Users/jasonkrol/.boot2docker/certs/boot2docker-vm

eval "$(docker-machine env dev)"
function docker-start() {
 docker-machine start dev
 eval "$(docker-machine env dev)"
}

# The next line updates PATH for the Google Cloud SDK.
source '/Users/jasonkrol/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/jasonkrol/google-cloud-sdk/completion.bash.inc'
eval "$(rbenv init -)"
