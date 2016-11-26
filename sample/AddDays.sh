#!/bin/bash
# AddDays Sample

source ./../sakura_common.sh

# Returns a new date string that adds the number of days specified
# on the specified date to the value.

for d in `seq 0 3`
do
  echo "now + $d"
  AddDays $d
done

ref=`GetDateYYYY-MM-DD`  # now date
for d in `seq 0 3`
do
  echo "AddDays $ref $d"
  AddDays $refs $d
  echo "AddDays $ref -$d"
  AddDays $refs -$d
done
