#!/bin/bash
# IsAlpha Sample

source ./../sakura_common.sh

# Checks whether the string a valid alphabet.
for i in 123 aBc 1ABC
do
  IsAlpha $i
  if [ $? -eq 0 ]; then
    echo $i : is alphabet.
  else
    echo $i : is not alphabet.
  fi
done
