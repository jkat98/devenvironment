source ~/.profile
source ~/git-completion.bash
source /opt/local/share/git-core/git-prompt.sh

#my aliases/shortcuts
alias v-web='cd ~/git/puppet-vagrant; vagrant up v-web-public'
alias v-cp='cd ~/git/puppet-vagrant; vagrant up v-web-controlpanel'
alias v-ds='cd ~/git/puppet-vagrant; vagrant up v-datasource'
alias v-lb='cd ~/git/puppet-vagrant; vagrant up v-web-loadbalancer'
alias v-mem='cd ~/git/messageeditorapi; vagrant up me-mongo'
alias v-mea='cd ~/git/messageeditorapi; vagrant up messageeditor-api'
alias v-rlb='cd ~/git/puppet-vagrant; vagrant reload v-web-loadbalancer'

alias v-up='cd ~/git/puppet-vagrant; v-lb; v-ds; v-cp; v-web; cd ~/git/messageeditorapi; v-mem; v-mea;'
alias v-sus='cd ~/git/puppet-vagrant; vagrant suspend;'
alias v-res='cd ~git/puppet-vagrant; vagrant resume;'

alias gs='git status'
alias gcm='git checkout master'
alias c='clear'
alias gb='git branch'
alias gl='git l'

alias sls='clear; ls -aGl'
LSCOLORS="DxGxFxdxCxdxdxhbadExEx"
export LSCOLORS

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

# set the prompt to show current working directory and git branch name, if it exists

# this prompt is a green username, black @ symbol, cyan host, magenta current working directory and white git branch (only shows if you're in a git branch)
# unstaged and untracked symbols are shown, too (see above)
# this prompt uses the short colour codes defined above
#PS1='${GREEN}\u${BLACK}@${CYAN}\h:${MAGENTA}\w${WHITE}`__git_ps1 " (%s)"`\$ '
#PS1='${CYAN}\u${WHITE}@${GREEN}\h:${MAGENTA}\w:\r\n${WHITE}`__git_ps1 "[%s]"`\$ '

# this is a cyan username, @ symbol and host, magenta current working directory and white git branch
# it uses the shorter , but visibly more complex, codes for text colours (shorter because the colour code definitions aren't needed)
# PS1='\[\033[0;36m\]\u@\h\[\033[01m\]:\[\033[0;35m\]\w\[\033[00m\]\[\033[1;30m\]\[\033[0;37m\]`__git_ps1 " (%s)"`\[\033[00m\]\[\033[0;37m\]\$ '

# return the prompt prefix for the second line

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

function horizline {
    TERMWIDTH=${COLUMNS}
    let promptsize=$(echo -n "-[\u]-[\h]-[${PWD}:]`set_git`-" | wc -c | tr -d " ")
    let fillsize=${TERMWIDTH}-${promptsize}+7
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="${fill}-"
        let fillsize=${fillsize}-1
    done
    echo ${fill}
}

# and here's one similar to Paul Irish's famous prompt ... not sure if this is the way he does it, but it works  :)
# \033[s = save cursor position
# \033[u = restore cursor position

#PS1='${MAGENTA}\u${WHITE} in ${GREEN}\w${WHITE}${MAGENTA}`__git_ps1 " on %s"`${WHITE}\r\n`set_prefix`${NORMAL}${CYAN}\033[s\033[60C (`date "+%a, %b %d"`)\033[u${WHITE} '
#PS1='${CYAN}\u${WHITE}@${GREEN}\h:${MAGENTA}\w:\r\n${WHITE}`__git_ps1 "[%s]"``set_prefix`${NORMAL}\$ '
#PS1='${CYAN}\u${WHITE}(${GREEN}\h${WHITE})${MAGENTA}\w:\r\n${WHITE}`set_prefix`${NORMAL}> '

#this is the final good prompt:
#PS1='${CYAN}\u${WHITE} (${YELLOW}\h${WHITE}) ${MAGENTA}\w: ${WHITE}`set_prefix`\r\n${NORMAL}\$ '
#PS1="$WHITE-[$CYAN\u$WHITE]-[$YELLOW\h$WHITE]-[$MAGENTA\w:$WHITE]"'`horizline``set_git`'"$WHITE-\n$WHITE$ "

#close to working final:
PROMPT1="$DARKGRAY-[$LIGHTBLUE\u$DARKGRAY]-[$CYAN\h$DARKGRAY]-[$PURPLE\w:$DARKGRAY]"
PROMPT2="$DARKGRAY]-"
PS1="$PROMPT1"'`horizline`[`set_git`'"$PROMPT2\n-$LIGHTGRAY$ "



#testing:
#PS1='[\u][\h][\w]`horizline``set_prefix`\n${WHITE}$ '
#PS1="$LIGHTBLUE[\u][\h][\w]`horizline``set_prefix`\n$ "
