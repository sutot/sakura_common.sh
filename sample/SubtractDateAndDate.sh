#!/bin/bash
# SubtractDateAndDate Sample

source ./../sakura_common.sh

# Subtract the date and date. ($1 - $2)
# the specified date to the value.
# Not support time, date only.

D1="2016/11/26"
D2="2016/11/1"

CALC=`SubtractDateAndDate $D1 $D2`
echo "($D1) - ($D2) = $CALC days"
