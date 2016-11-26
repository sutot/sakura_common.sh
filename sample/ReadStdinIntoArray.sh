#!/bin/bash
# ReadStdinIntoArray Sample

source ./../sakura_common.sh

# Read lines in stdin into an array

cat <<EOS > ReadStdinIntoArray.tmp.txt
Debian
Ubuntu

Red Hat
CentOS

Slackware
openSUSE

Arch Linux
Gentoo
EOS


# run Process Substitution (see man bash)
ReadStdinIntoArray < <(cat ReadStdinIntoArray.tmp.txt)
# not run pipe
# cat ReadStdinIntoArray.tmp.txt | ReadStdinIntoArray

size=${#array_list[@]}

echo lines = $size

for i in `seq 1 $size`
do
  echo $i : ${array_list[$(($i-1))]}
done

rm -f ReadStdinIntoArray.tmp.txt
