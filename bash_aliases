alias g+++='g++ -std=c++11'
alias ll='ls -l'
alias la='ll -a'
alias l='ls -CF'
alias py=ipython
alias src='source ~/.bashrc'
alias cdc='cd -'
alias g='git'
alias scalagrep='find . -name "*[.]scala" | xargs grep 2> /dev/null'
alias jsgrep='find . -name "*[.]js" | xargs grep 2> /dev/null'
alias agl='ag -G .jl'
alias myip='ipconfig getifaddr en0'

function c () {
    cd $1 && l;
}

alias mklatex='latexmk -pdf -pvc -interaction=nonstopmode'
if [ -f ~/.bash_aliases_local ]; then

  . ~/.bash_aliases_local
fi
