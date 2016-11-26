#!/bin/bash
# OutStderr Sample

source ./../sakura_common.sh

# stderr(2)に引数を出力します

OutStderr "message 1" > OutStderr.out
OutStderr "message 2" 2> OutStderr.out

echo "OutStderr.out ファイル内容"
cat OutStderr.out
rm OutStderr.out
