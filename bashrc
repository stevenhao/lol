PS1='\[\e[1;33m\][\u@\h \W \t]\$\[\e[0m\] '
PATH=~/bin:/usr/local/bin:$PATH

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

if [ -f ~/.bashrc_local ]; then
  . ~/.bashrc_local
fi

function cd {
  builtin cd "$@" && [ -d ~/.ctfd ] && pwd > ~/.ctfd/lastdir
}

function ctfd {
  [ -d ~/.ctfd ] || echo '~/.ctfd does not exist'
  [ -f ~/.ctfd/lastdir ] && cd $(cat ~/.ctfd/lastdir)
}

