cur=`pwd`
(set -x
for target in "$@"
do
  if [ -f ~/.$target ]
    then
      today=`date +"%d-%m-%Y"`
      mv -i ~/.$target old/.$target-$today
  fi

  ln -s $cur/$target ~/.$target
done
)
