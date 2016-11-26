#!/bin/bash
# IsAlpha Sample

source ./../sakura_common.sh

# 英文字だけの文字列かをチェックします
for i in 123 aBc 1ABC
do
  IsAlpha $i
  if [ $? -eq 0 ]; then
    echo $i : 英文字です
  else
    echo $i : 英文字以外の文字が含まれています
  fi
done
