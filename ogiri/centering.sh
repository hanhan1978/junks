# !/bin/bash


while read line
do
  echo $line
  echo `expr length "$line"`
done
