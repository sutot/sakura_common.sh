#!/bin/bash
# SubtractDateAndDate Sample

source ./../sakura_common.sh

# 日付の引き算を行い日数を返却します ($1 - $2)
# 時間はサポートしていません

D1="2016/11/26"
D2="2016/11/1"

CALC=`SubtractDateAndDate $D1 $D2`
echo "($D1) - ($D2) = $CALC days"
