#!/bin/bash
# IsLeapYear Sample

source ./../sakura_common.sh

# うるう年のチェックをおこないます

now_year=`GetDateYYYY/MM/DD | tr / " " | awk '{ print $1 }'`
now_year_add10=`expr $now_year + 10`

for y in `seq $now_year $now_year_add10`
do
  IsLeapYear $y
  if [ $? -eq 1 ]; then
    msg="うるう年"
  else
    msg="平年"
  fi
  echo $y : $msg
done
