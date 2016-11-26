#!/bin/bash
# Trim, LTrim, RTrim Sample

source ./../sakura_common.sh

TARGET="     sakura     "
echo "TARGET STRING : #${TARGET}#"
echo  # \n

echo "Trim"
TRIM_STR=`Trim $TARGET`
echo "#${TRIM_STR}#"
echo  # \n

echo "LTrim"
TRIM_STR=`LTrim "$TARGET"`  # "$TARGET" is OK, $TARGET is NG
echo "#${TRIM_STR}#"
echo  # \n

echo "RTrim"
TRIM_STR=`RTrim "$TARGET"`  # "$TARGET" is OK, $TARGET is NG
echo "#${TRIM_STR}#"
