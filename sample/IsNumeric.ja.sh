#!/bin/bash
# IsNumeric サンプル

source ./../sakura_common.sh

# 数字かどうかを確認します
for i in 123 123abc
do
  IsNumeric $i
  if [ $? -eq 0 ]; then
    echo $i : 数字です 
  else
    echo $i : 数字ではありません
  fi
done
