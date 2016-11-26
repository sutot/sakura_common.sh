#!/bin/bash
# ReadStdinIntoArray Sample

source ./../sakura_common.sh

# 標準入力からの情報を配列に格納します

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


# Process Substitution を使用してください(詳細は man bash)
ReadStdinIntoArray < <(cat ReadStdinIntoArray.tmp.txt)

# 以下のようにパイプを使用すると動作しません
# cat ReadStdinIntoArray.tmp.txt | ReadStdinIntoArray

size=${#array_list[@]}

echo lines = $size

for i in `seq 1 $size`
do
  echo $i : ${array_list[$(($i-1))]}
done

rm -f ReadStdinIntoArray.tmp.txt
