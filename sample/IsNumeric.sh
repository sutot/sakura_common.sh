#!/bin/bash
# IsNumeric Sample

source ./../sakura_common.sh

# Checks whether the string a valid umber.
for i in 123 123abc
do
  IsNumeric $i
  if [ $? -eq 0 ]; then
    echo $i : is numeric.
  else
    echo $i : is not numeric.
  fi
done
