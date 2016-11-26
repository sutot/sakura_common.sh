#!/bin/bash
# GetDateIntoMap Sample

source ./../sakura_common.sh

# Assign the now date to the Map.

GetDateIntoMap

echo DATEMAP[YEAR]
echo ${DATEMAP[YEAR]}

echo DATEMAP[MONTH]
echo ${DATEMAP[MONTH]}

echo DATEMAP[DAY]
echo ${DATEMAP[DAY]}

echo DATEMAP[HOUR]
echo ${DATEMAP[HOUR]}

echo DATEMAP[MINUTE]
echo ${DATEMAP[MINUTE]}

echo DATEMAP[SECOND]
echo ${DATEMAP[SECOND]}

echo DATEMAP[WEEKDAY]
echo ${DATEMAP[WEEKDAY]}

echo '${DATEMAP[YEAR]}/${DATEMAP[MONTH]}/${DATEMAP[DAY]}'
echo ${DATEMAP[YEAR]}/${DATEMAP[MONTH]}/${DATEMAP[DAY]}
