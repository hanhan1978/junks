alias ll='ls -lA --color'

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