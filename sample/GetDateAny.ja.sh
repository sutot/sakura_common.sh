#!/bin/bash
# GetDate* Sample

source ./../sakura_common.sh

# dateコマンドの出力を指定した形式で出力します
echo 関数: GetDateYYYYMMDD
GetDateYYYYMMDD
echo 関数: GetDateYYYY-MM-DD
GetDateYYYY-MM-DD
echo 関数: GetDateYYYY/MM/DD
GetDateYYYY/MM/DD
echo 関数: GetDateYYYYMMDDHHMISS
GetDateYYYYMMDDHHMISS
echo 関数: GetDateYYYY/MM/DD_HH:MI:SS
GetDateYYYY/MM/DD_HH:MI:SS
