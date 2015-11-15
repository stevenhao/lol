export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

. ~/.bashrc

function tabname {
  printf "\e]1;$1\a"
}

function winname {
  printf "\e]2;$1\a"
}
