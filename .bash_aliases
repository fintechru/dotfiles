#!/bin/bash

shopt -s expand_aliases

alias ns='sudo netstat -tnlp'

alias gco='git checkout'
alias gst='git stash'
alias gp='git pull --all && git fetch --tags'
alias gb='git branch -a'
alias gs='git status'
alias gd='git diff'
alias ga='git add -f'
alias gam='git status | sed -E "s/.*modified: *([^ ]*).*/\1/;t;d" | xargs git add -f'
alias gc='git commit -m'
alias gpo='git push origin'
alias gm='git merge'
alias gl='git log'
function ghc() { git clone "git@github.com:$1" ;}

alias dp='docker ps'
alias dpa='docker ps -a'
alias dprune='docker system prune -f'
alias dc='docker rm -vf'
function dq()  { docker ps -qf name="$1" ;}
function dqa() { docker ps -qaf name="$1" ;}
function ds()  { docker stop -f `dq $1` ;}
function dx()  { docker rm -f `dqa $1` ;}
function dxi() { docker rmi -f $1 ;}
function de()  { c=`dq $1` ; shift ; docker exec -ti $c bash -c "$@" ;}
function db()  { de $1 bash ;}
function dl()  { docker logs `dq $1` ;}
function dlf() { docker logs -f --tail 0 `dq $1` ;}

alias cg="grep --color=always"
function mg() { grep "$@" -nrI --color=always --exclude-dir=node_modules . ;}
