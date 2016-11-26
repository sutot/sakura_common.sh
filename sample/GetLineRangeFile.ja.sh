#!/bin/bash
# GetLineRangeFile Sample

source ./../sakura_common.sh

# ファイルの指定した範囲行を表示します

cat <<EOS > ./GetLineRangeFile.tmp
line1
line2
line3
line4
line5
line6
line7
line8
line9
line10
EOS

GetLineRangeFile 5 9 ./GetLineRangeFile.tmp

rm -f ./GetLineRangeFile.tmp
