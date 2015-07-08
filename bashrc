PS1='\[\e[1;33m\][\u@\h \W \t]\$\[\e[0m\] '
PATH=~/bin:$PATH

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

