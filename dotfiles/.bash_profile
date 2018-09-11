alias ll='ls --color -lA'

export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad

HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ';
HISTSIZE=10000
HISTIGNORE=ls:history:ll

if [ -f ~/.git-completion.bash ]; then
    source ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

alias tmux='tmux -2'

alias d='docker-compose'


if [[ -s ~/.nvm/nvm.sh ]];
 then source ~/.nvm/nvm.sh
fi
export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$HOME/.phpenv/plugins/php-build/bin:$PATH"
eval "$(phpenv init -)"


export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$HOME/bin:$PATH

alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'
