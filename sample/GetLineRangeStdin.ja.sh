#!/bin/bash
# GetLineRangeStdin Sample

source ./../sakura_common.sh

# 標準入力(stdin)からの入力された複数行を指定された範囲の行を表示します
# 使用例
#   cat /etc/hosts | GetLineRangeStdin 2 10

cat <<EOS | GetLineRangeStdin 2 4
line1
line2
line3
line4
line5
EOS
