#!/bin/bash
# UpperCase LowerCase Sample

source ./../sakura_common.sh

ORG_STR="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

# All lower case letters.
echo "IN: $ORG_STR"
LowerCase "$ORG_STR"

# All Upper case letters.
LOW_STR=`LowerCase "$ORG_STR"`
echo "IN: $LOW_STR"
UpperCase "$LOW_STR"
