# !/bin/bash

for num in `seq $1`;
do 
  product=`echo $num | sed -e ":loop; /[0-9][0-9]/{ s/\([0-9]\)\([0-9]\)/\1 * \2/ ;b loop}" -e "s/^/1 /" -e "s/$/ * p/" | dc`;

  if [ 0 -eq $product ] ; then
    continue;
  elif [ 0 -eq `expr $num % $product` ] ; then
    echo $num
  fi
done;
