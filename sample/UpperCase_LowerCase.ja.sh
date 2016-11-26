#!/bin/bash
# UpperCase LowerCase Sample

source ./../sakura_common.sh

ORG_STR="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# 半角英字大文字を半角英字小文字に変換します
echo "IN: $ORG_STR"
LowerCase "$ORG_STR"

# 半角英字小文字を半角英字大文字に変換します
echo "IN: $ORG_STR"
LOW_STR=`LowerCase "$ORG_STR"`
echo "IN: $LOW_STR"
UpperCase "$LOW_STR"
