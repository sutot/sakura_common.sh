#!/bin/bash
# IsLeapYear Sample

source ./../sakura_common.sh

# Check leap year.

now_year=`GetDateYYYY/MM/DD | tr / " " | awk '{ print $1 }'`
now_year_add10=`expr $now_year + 10`

for y in `seq $now_year $now_year_add10`
do
  IsLeapYear $y
  if [ $? -eq 1 ]; then
    msg="leap year"
  else
    msg="not leap year"
  fi
  echo $y : $msg
done
