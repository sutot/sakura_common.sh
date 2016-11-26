#!/bin/bash
# SubtractDays Sample

source ./../sakura_common.sh

# Returns a new date string that subtracts the number of days specified on
# the specified date to the value.

for d in `seq 0 3`
do
  echo "now - $d"
  SubtractDays $d
done

ref=`GetDateYYYY-MM-DD`  # now date
for d in `seq 0 3`
do
  echo "SubtractDays $ref $d"
  SubtractDays $refs $d
  echo "SubtractDays $ref -$d"
  SubtractDays $refs -$d
done
