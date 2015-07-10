cur=`pwd`
for target in "$@"
do
  if [ -f ~/.$target ]
    then
      export VERSION_CONTROL=numbered
      echo mv -b ~/.$target old
      mv -b ~/.$target old
  fi

  echo ln -s $cur/$target ~/.$target
  ln -s $cur/$target ~/.$target
done
