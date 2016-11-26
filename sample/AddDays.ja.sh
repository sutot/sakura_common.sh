#!/bin/bash
# AddDays Sample

source ./../sakura_common.sh

# 指定した日付に指定した日数を加算します
# 基準日を省略した場合は、本日が基準日となります

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
