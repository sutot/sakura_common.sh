#!/bin/bash
# Length Sample

# Return the length(byte) of the string.

source ./../sakura_common.sh

STRING="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

echo IN: $STRING
LEN=`Length $STRING`
echo "Length: $LEN"
