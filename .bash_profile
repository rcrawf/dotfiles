parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1='\[\e[38;5;142m\]\u\[\e[0m\]@\h'
export PS1="\[\e[38;5;142m\]\u\[\e[0m\]@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

alias k='kubecolor'
alias assume="source assume"

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"

source <(kubecolor completion bash)
complete -o default -F __start_kubectl k

alias python=python3

export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi
