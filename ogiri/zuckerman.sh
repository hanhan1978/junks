# !/bin/bash

for num in `seq $1`;
do 
  length=`expr length $num`
  product=1
  i=0;
  while [ $i -lt $length ]
    do
    i=`expr $i + 1`
    figure=`echo $num | cut -c $i`
    product=`expr $product \* $figure`
  done
  
  if [ 0 -eq $product ] ; then
    continue;
  elif [ 0 -eq `expr $num % $product` ] ; then
    echo $num
  fi
done;
