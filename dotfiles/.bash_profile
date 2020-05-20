alias ll='ls --color -lA'

# load for vte gtk widget
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

export CLICOLOR=1
export LSCOLORS=ExGxcxdxCxegedabagacad

export PROMPT_COMMAND="$PROMPT_COMMAND;history -a;history -c;history -r"
export HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="%F %T  "
HISTSIZE=100000
HISTFILESIZE=100000
HISTIGNORE='ls:history:ll:exit:export AWS*'
shopt -s histappend
shopt -s cmdhist
shopt -s lithist

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

export PATH="$HOME/.phpenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.phpenv/plugins/php-build/bin:$PATH"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/dev/hanhan/junks/tools/aws"
export PATH="$PATH:$HOME/dev/hanhan/junks/tools/desktop"
export PATH="$PATH:$HOME/dev/hanhan/junks/tools/diff"
export PATH="$PATH:$HOME/dev/hanhan/junks/tools/git"
export PATH="$PATH:$HOME/dev/hanhan/junks/tools/misc"
eval "$(phpenv init -)"


export GOPATH=$HOME/gopath
export PATH=$GOPATH:$GOPATH/bin:$HOME/bin:$PATH
export PATH=/snap/bin:$PATH

alias pbcopy='xclip -selection c'
alias pbpaste='xclip -selection c -o'

eval "$(hub alias -s)"

# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
export HSTR_CONFIG=hicolor
