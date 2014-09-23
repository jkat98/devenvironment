source ~/.profile
source ~/git-completion.bash
source /opt/local/share/git-core/git-prompt.sh

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOARCH=amd64
export GOOS=darwin
export GOBIN=$HOME/go/bin
export PATH=$PATH:$GOBIN

#selenium GUI testing



#my aliases/shortcuts
alias v-web='vagrant up v-web-public --provision'
alias v-cp='vagrant up v-web-controlpanel --provision'
alias v-ds='vagrant up v-datasource'
alias v-lb='vagrant up v-web-loadbalancer'
alias me-api='bash ~/meapi.sh'
alias me-up='bash ~/meup.sh'

alias v-rlb='vagrant reload v-web-loadbalancer'

alias v-up='v-lb; v-ds; v-cp; v-web;'
alias v-sus='vagrant suspend;'
alias v-res='vagrant resume;'

alias gs='git status -sb'
alias gcm='git checkout master'
alias gf='git fetch'
alias gp='git pull'
alias c='clear'
alias gb='git branch'
alias gl='git l'
alias gsu='git submodule update --recursive'
alias gd='git diff'
alias gnuke='git branch --merged | xargs git branch -d'
alias gos='open https://github-enterprise.colo.lair'
alias sites='cd ~/git/sites'

alias dateR="python -c 'from email.Utils import formatdate; print formatdate(localtime=True)'"
alias vtop="vtop --theme dark"

alias ls='ls -aG'
alias sls='clear; ls -aGl'
LSCOLORS="Exfxcxdxbxegedabagacad"
export LSCOLORS

alias ..='cd ..'

alias g_sites='NODE_ENV=development-sites grunt server'

paywhatevs=~/go/src/github.com/pietrojs/paywhatevs


# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES=""

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE=""

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM=""

# BLACK=$(tput setaf 0)
# RED=$(tput setaf 1)
# GREEN=$(tput setaf 2)
# YELLOW=$(tput setaf 3)
# LIME_YELLOW=$(tput setaf 190)
# POWDER_BLUE=$(tput setaf 153)
# BLUE=$(tput setaf 4)
# MAGENTA=$(tput setaf 5)
# CYAN=$(tput setaf 6)
# WHITE=$(tput setaf 7)
# NORMAL=$(tput sgr0)

BLACK='\[\e[0;30m\]'
DARKGRAY='\[\e[1;30m\]'
RED='\[\e[0;31m\]'
LIGHTRED='\[\e[1;31m\]'
GREEN='\[\e[0;32m\]'
LIGHTGREEN='\[\e[1;32m\]'
BROWN='\[\e[0;33\]'
YELLOW='\[\e[1;33\]'
BLUE='\[\e[0;34m\]'
LIGHTBLUE='\[\e[1;34m\]'
PURPLE='\[\e[0;35m\]'
LIGHTPURPLE='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
LIGHTGRAY='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'

# get branch info from GIT
function set_git {
    BRANCH=`__git_ps1`
    ABRANCH=`__git_ps1 "%s"`
    if [[ -z $BRANCH ]]; then
        echo "$(tput setaf 1)"
    else
        if [[ "$BRANCH" == *"*"* ]]; then
            echo "$(tput setaf 1)${ABRANCH%%??}"
        else
            echo "$(tput setaf 2)${ABRANCH}"
        fi
    fi
}

# create horizontal line that fills the middle of the terminal with dynamic width
function horizline {
    TERMWIDTH=${COLUMNS}
    let promptsize=$(echo -n "-[\u]-[\h]-[${PWD}:]`set_git`-" | wc -c | tr -d " ")
    let fillsize=${TERMWIDTH}-${promptsize}+10
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="${fill}-"
        let fillsize=${fillsize}-1
    done
    echo ${fill}
}

PROMPT1="$DARKGRAY-[$GREEN\u$DARKGRAY:$CYAN\h$DARKGRAY]-[$PURPLE\w:$DARKGRAY]"
PROMPT2="$DARKGRAY]-"
PS1="$PROMPT1"'`horizline`[`set_git`'"$PROMPT2\n-$LIGHTGRAY$ "

[ -s "/Users/jasonk/.nvm/nvm.sh" ] && . "/Users/jasonk/.nvm/nvm.sh" # This loads nvm

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}
