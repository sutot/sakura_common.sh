#!/bin/bash
# Length Sample

# 文字列の長(バイト数)を返却します

source ./../sakura_common.sh

STRING="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

echo IN: $STRING
LEN=`Length $STRING`
echo "Length: $LEN"
