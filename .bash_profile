if [ -z "$STY" ]
then screen -x || screen
fi

[ -f ~/.bashrc ] && . ~/.bashrc

source ~/.bash_aliases

if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent` >/dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

export PATH="$PATH:$HOME/goland/bin"

export GOROOT="$HOME/go"
export GOPATH="$HOME/.go"

export RUST_BACKTRACE=1

export DOCKER_CONFIG="$HOME/.docker/"
 
export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"

export PS1='\D{%d %b} \A \[\033[01;34m\]\u\[\033[00m\]@\[\033[01;33m\]\h\[\033[00m\]:\[\033[01;36m\]\w\[\033[00m\]\$ '

export PROMPT_COMMAND='[[ "$TERM" == screen* ]] && screen -X title `echo ${PWD##*/}`/'
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

trap '[[ "$TERM" == screen* ]] && screen -X title ${BASH_COMMAND%% *}' DEBUG

shopt -s histappend
shopt -s cmdhist

export HISTCONTROL=ignorespace:erasedups
export HISTTIMEFORMAT='%h %d %H:%M:%S '
export HISTSIZE=10000
export HISTFILESIZE=10000
