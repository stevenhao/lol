cur=`pwd`
for target in "$@"
do
  if [ -f ~/.$target ]
    then
      today=`date +"%d-%m-%Y"`
      echo mv -i ~/.$target old/.$target-$today
      mv -i ~/.$target old/.$target-$today
  fi

  echo ln -s $cur/$target ~/.$target
  ln -s $cur/$target ~/.$target
done
