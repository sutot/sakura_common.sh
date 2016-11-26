#!/bin/bash
# ReadFileIntoArray Sample

source ./../sakura_common.sh

# Read lines in file into an array

cat <<EOS > ReadFileIntoArray.tmp.txt
Debian
Ubuntu

Red Hat
CentOS

Slackware
openSUSE
EOS

ReadFileIntoArray ReadFileIntoArray.tmp.txt

size=${#array_list[@]}

echo lines = $size

for i in `seq 1 $size`
do
  echo $i : ${array_list[$(($i-1))]}
done

rm -f ReadFileIntoArray.tmp.txt
