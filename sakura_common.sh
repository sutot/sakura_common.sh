# Copyright (C) 2016 @sutot
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0

# Description
# This script is a summary of the following web site article.
# http://linux.just4fun.biz/
# This script worked on bash and GNU/Linux and Cygwin.
# Please include this script and use it.
# 
# version 0.1.1 (2016-11)
#   bugfix and typo corrected.
#   Written by SUTO Takayuki
# version 0.1 (2016-11)
#   1st commit
#   Written by SUTO Takayuki

# This script version.
SAKURA_COMMON_SH_VERSION="0.1.1"

# IsNumeric
# Checks whether the string a valid umber.
# Parameters:
#  $1 - the string to check
# Returns:
#  0 if the string is a correctly formatted number
IsNumeric() {
  if [ ! -n "$1" ]; then
    return 1  # $1 is empty
  fi
  expr "$1" + 1 > /dev/null 2>&1
  if [ ! $? -lt 2 ]; then
    return 1
  fi
  return 0
}

# IsAlpha
# Checks whether the string a valid alphabet. 
# Parameters:
#  $1 - the string to check
# Returns:
#  0 if the string is a correctly formatted alphabet 
IsAlpha() {
  if [ ! -n "$1" ]; then
    return 1  # $1 is empty
  fi
  a=`echo -n $1 | sed 's/[^a-zA-Z]//g' `
  if [ -n "$a" ]; then
    return 1
  fi
  return 0
}

# OutStderr
# Output string to stderr. 
# Parameters:
#  $* - error message
# Returns:
#  Output message to stderr
OutStderr() {
  echo "$*" 1>&2
}

# GetRangeLineStdin
# Gets the line of the specified range from stdin.
# Parameters:
#  $1 - start line number
#  $2 - stop line number
# Returns:
#  Output lines to stdout
#  $?=0 if successful.
GetLineRangeStdin() {
  FUNC=GetRangeLineStdin
  if [ $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  for n in "$1" "$2"
  do
    IsNumeric "$n"
    if [ $? -ne 0 ]; then
      echo "$FUNC : $n argument is not a number" 1>&2
      return 2
    fi
  done
  if [ -p /dev/stdin ]; then
    cat - | sed -n "$1,$2p"
      if [ $? -ne 0 ]; then
        echo "$FUNC : failed" 1>&2
        return 3
      fi
  fi
  return 0
}

# GetLineRangeFile
# Gets the line of the specified range from file.
# Parameters:
#  $1 - start line number
#  $2 - stop line number
#  $3 - target filename
# Returns:
#  Output lines to stdout
#  $?=0 if successful.
GetLineRangeFile() {
  FUNC=GetLineRangeFile
  if [ $# -ne 3 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  for n in "$1" "$2"
  do
    IsNumeric "$n"
    if [ $? -ne 0 ]; then
      echo "$FUNC : $n argument is not a number" 1>&2
      return 2
    fi
  done
  if [ ! -f "$3" ]; then
    echo "$FUNC : $3 no such file" 1>&2
    return 2
  fi
  cat "$3" | sed -n "$1,$2p"
    if [ $? -ne 0 ]; then
      echo "$FUNC : failed" 1>&2
      return 2
    fi
  return 0
}

# IsEndOfMonth
# Check end of the month.
# Parameters:
#  None
# Returns:
#  $?=0 if not end of the month
#  $?=1 if end of month
IsEndOfMonth() {
  if [ `date -d day '+%d'` = '01' ]; then
    return 1
  fi
  return 0
}

# IsLeapYear 
# Check leap year.
# Parameters:
#  $1 - year(YYYY)
# Returns:
#  $?=0 if not leap year
#  $?=1 if leap year
#  $?>1 if failed
IsLeapYear() {
  FUNC=IsLeapYear
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 2
  fi
  IsNumeric $1
  if [ $? -ne 0 ]; then
    echo "$FUNC : argument is not a number" 1>&2
    return 3
  fi
  if [ ${#1} -ne 4 ]; then
    echo "$FUNC : $1 invalid vaule" 1>&2
    return 4
  fi
  date -d "$1-2-29" > /dev/null 2>&1
  if [ $? -eq 0 ]; then
    return 1
  fi
  return 0
}

# GetDateYYYYMMDD
# Convert current date to YYYYMMDD format.
# Parameters:
#  None
# Returns:
#  Output YYYYMMDD to stdout
GetDateYYYYMMDD() {
  date '+%Y%m%d'
}

# GetDateYYYY-MM-DD
# Convert current date to YYYY-MM-DD format.
# Parameters:
#  None
# Returns:
#  Output YYYY-MM-DD to stdout
GetDateYYYY-MM-DD() {
  date '+%Y-%m-%d'
}

# GetDateYYYY/MM/DD
# Convert current date to YYYY/MM/DD format.
# Parameters:
#  None
# Returns:
#  Output YYYY/MM/DD to stdout
GetDateYYYY/MM/DD() {
  date '+%Y/%m/%d'
}

# GetDateYYYYMMDDHHMISS 
# Convert current date to YYYYMMDDHHMISS format.
# Parameters:
#  None
# Returns:
#  Output YYYYMMDDHMS to stdout
GetDateYYYYMMDDHHMISS() {
  date '+%Y%m%d%H%M%S'
}

# GetDateYYYY/MM/DD_HH:MI:SS
# Convert current date to YYYY/MM/DD HH:MI:SS format.
# Parameters:
#  None
# Returns:
#  Output YYYY/MM/DD HH:MI:SS to stdout
GetDateYYYY/MM/DD_HH:MI:SS() {
  date '+%Y/%m/%d %H:%M:%S'
}

# GetTimeHHMISS
# Convert current time to HHMISS format.
# Parameters:
#  None
# Returns:
#  Output HHMISS to stdout
GetTimeHHMISS() {
  date '+%H%M%S'
}

# GetTimeHH:MI:SS
# Convert current time to HHMISS format.
# Parameters:
#  None
# Returns:
#  Output HHMISS to stdout
GetDateHH:MI:SS() {
  date '+%H:%M:%S'
}

# UnixTime
# seconds since 1970-01-01 00:00:00 UTC.
# Parameters:
#  [$1] - reference date
# Returns:
#  Output Unix Time to stdout
#  $?=0 if successful.
#  $?>0 if failed.
UnixTime() {
  FUNC=UnixTime
  if [ $# -ne 0 -a $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  if [ $# -eq 0 ]; then
    date +%s
    return 0
  fi
  cmd=""
  if [ $# -eq 1 ]; then
    cmd="date +%s -d \"$1\""
    eval $cmd
    if [ $? -ne 0 ]; then
      echo "$FUNC : invalid reference date" 1>&2
      return 1
    fi
  fi
  return 0
}

# UnixTime2UTC
# Display UNIXTIME to UTC time.
# Parameters:
#  $1 - Unix Time
# Returns:
#  Output UTC Datetime to stdout
#  $?=0 if successful.
#  $?>0 if failed.
UnixTime2UTC() {
  FUNC=UnixTime2UTC
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $1
  if [ $? -ne 0 ]; then
    echo "$FUNC : argument is not a number" 1>&2
    return 2
  fi
  date -u -d "@$1"
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid unix time" 1>&2
    return 3
  fi
  return 0
}

# UnixTime2LocalTime
# Display UNIXTIME to Local time.
# Parameters:
#  $1 - Unix Time
# Returns:
#  Output Local datetime to stdout
#  $?=0 if successful.
#  $?>0 if failed.
UnixTime2LocalTime() {
  FUNC=UnixTime2LocalTime
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $1
  if [ $? -ne 0 ]; then
    echo "$FUNC : argument is not a number" 1>&2
    return 2
  fi
  date -d "@$1"
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid unix time" 1>&2
    return 3
  fi
  return 0
}

# AddDays
# Returns a new date string that adds the number of days specified
# on the specified date to the value.
# Parameters:
#  $1 - number of days
#  [$2] - reference date
#    nothing if reference date is now
# Returns:
#    date string (%Y-%m-%d)
#    $?=0 if successful.
#    $?>0 if failed.
AddDays() {
  FUNC=AddDays
  if [ $# -ne 1 -a $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $1
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid number of days" 1>&2
    return 2
  fi
  if [ $# -eq 2 ]; then
     ret_date=`date '+%Y-%m-%d' --date "$2 $1 days"`
     if [ $? -ne 0 ]; then
       echo "$FUNC : invalid reference date" 1>&2
       return 3
     fi
  else
     ret_date=`date '+%Y-%m-%d' --date "$1 days"`
     if [ $? -ne 0 ]; then
       echo "$FUNC : unknown error" 1>&2
       return 4
     fi
  fi
  echo $ret_date
  return 0
}

# SubtractDays
# Returns a new date string that subtracts the number of days specified on
# the specified date to the value.
# Parameters:
#  $1 - number of days
#  [$2] - reference date
#    nothing if reference date is now
# Returns:
#    date string (%Y-%m-%d)
#    $?=0 if successful.
#    $?>0 if failed.
SubtractDays() {
  FUNC=SubtractDays
  if [ $# -ne 1 -a $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $1
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid number of days" 1>&2
    return 2
  fi
  if [ $# -eq 2 ]; then
     ret_date=`date '+%Y-%m-%d' --date "$2 $1 days ago"`
     if [ $? -ne 0 ]; then
       echo "$FUNC : invalid reference date" 1>&2
       return 3
     fi
  else
     ret_date=`date '+%Y-%m-%d' --date "$1 days ago"`
     if [ $? -ne 0 ]; then
       echo "$FUNC : unknown error" 1>&2
       return 4
     fi
  fi
  echo $ret_date
  return 0
}

# SubtractDateAndDate
# Subtract the date and date. ($1 - $2)
# the specified date to the value.
# Not support time, date only.
# Parameters:
#  $1 - date %Y-%m-%d
#  $2 - date %Y-%m-%d
# Returns:
#    days
#    $?=0 if successful.
#    $?>0 if failed.
SubtractDateAndDate() {
  FUNC=SubtractDateAndDate
  if [ $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  expr \( `date -d"$1" +%s` - `date -d"$2" +%s` \) / 86400  # 86400sec=1h(3600sec)*24h
  if [ $? -ne 0 ]; then
    return 1
  fi
  return 0
}

# GetDateIntoMap
# Assign the now date to the Map.
# Parameters:
#   None
# Returns:
#    $DATEMAP
#      ${DATEMAP[YEAR]}    : year
#      ${DATEMAP[MONTH]}   : month (1..12)
#      ${DATEMAP[DAY]}     : day (1..31)
#      ${DATEMAP[HOUR]}    : hour (0..23)
#      ${DATEMAP[MINUTE]}  : minute (0..59)
#      ${DATEMAP[SECOND]}  : second (0..59)
#      ${DATEMAP[WEEKDAY]} : second (0..6) 0 is sun, 6 is sat
#    $?=0 if successful.
#    $?>0 if failed.
# Usage :
#  e.g.
#    #/bin/bash
#    source ./sakura_common.sh
#    GetDateIntoMap
#    echo ${DATEMAP[YEAR]}/${DATEMAP[MONTH]}/${DATEMAP[DAY]}
GetDateIntoMap() {
  FUNC=GetDateIntoMap
  declare -gA DATEMAP
  s=`date '+%Y %-m %-d %-H %-M %-S %w'`
  if [ $? -ne 0 ]; then
    echo "$FUNC : date command failed" 1>&2
    return 1
  fi
  arry=(`echo $s`)
  DATEMAP[YEAR]=${arry[0]}
  DATEMAP[MONTH]=${arry[1]}
  DATEMAP[DAY]=${arry[2]}
  DATEMAP[HOUR]=${arry[3]}
  DATEMAP[MINUTE]=${arry[4]}
  DATEMAP[SECOND]=${arry[5]}
  DATEMAP[WEEKDAY]=${arry[6]}
  return 0
}

# ReadFileIntoArray
# Read lines in file into an array
# Parameters:
#  $1 = filename
# Returns:
#  Set the array result to $array_list
#  $?=0 if successful.
#  $?>0 if failed.
ReadFileIntoArray() {
  FUNC=ReadFileIntoArray
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  if [ ! -f "$1" ]; then
    echo "$FUNC : $1 no such file" 1>&2
    return 2
  fi
  array_list=()
  while read -r line
  do
    array_list+=("$line")
  done < <(cat $1)
  return 0
}

# ReadStdinIntoArray
# Read lines in stdin into an array
# Parameters:
#  None
# Returns:
#  Set the array result to $array_list
#  $?=0 if successful.
#  $?>0 if failed.
# Usage :
#  e.g.
#    #/bin/bash
#    #run Process Substitution, not run pipe
#    source ./sakura_common.sh
#    ReadStdinIntoArray < <(find .)
#    echo ${#array_list[@]}
ReadStdinIntoArray() {
  if [ ! -p /dev/stdin ]; then
    return 1
  fi
  array_list=()
  while read -r line
  do
    array_list+=("$line")
  done < <(cat -)
  return 0
}

# Rigth
# Returns a string containing a specified number of characters
# from the right side of a string.
# Parameters:
#  $1 = string
#  $2 = length
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
Right() {
  FUNC=Right
  if [ $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $2
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 2
  fi
  if [ `expr length "$1"` -le $2 ]; then
    echo $1
    return 0 
  fi
  l=`expr length "$1"`
  p=`expr $l - $2 + 1`
  expr substr "$1" $p $2
  if [ $? -ne 0 ]; then
    return 3
  fi
  return 0
}

# Left
# Returns a string that contains a specified number of characters
# from the left side of a string.
# Parameters:
#  $1 = string
#  $2 = length
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
Left() {
  FUNC=Left
  if [ $# -ne 2 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $2
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 2
  fi
  if [ `expr length "$1"` -le $2 ]; then
    echo $1
    return 0 
  fi
  expr substr "$1" 1 $2
  if [ $? -ne 0 ]; then
    echo "$FUNC : expr command failed" 1>&2
    return 2
    return 3
  fi
  return 0
}

# Mid
# Returns a string containing a specified number of characters
# from a string.
# Parameters:
#  $1 = string
#  $2 = start (one-based)
#  $3 = length
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
Mid() {
  FUNC=Mid
  if [ $# -ne 3 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  IsNumeric $2
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 2
  fi
  IsNumeric $3
  if [ $? -ne 0 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 2
  fi
  expr substr "$1" $2 $3
  if [ $? -ne 0 ]; then
    echo "$FUNC : expr command failed" 1>&2
    return 3
  fi
  return 0
}

# Length
# Return the length(byte) of the string.
# Parameters:
#  $1 = string
# Returns:
#  length(byte)
#  $?=0 if successful.
#  $?>0 if failed.
Length() {
  FUNC=Length
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo `expr length "$1"` 
  if [ $? -ne 0 ]; then
    echo "$FUNC : expr command failed" 1>&2
    return 2
  fi
  return 0
}

# UpperCase
# All upper case letters.
# Parameters:
#  $1 = string
# Returns:
#  all upper case letters.
#  $?=0 if successful.
#  $?>0 if failed.
UpperCase() {
  FUNC=UpperCase
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo "$1" | tr [:lower:] [:upper:]
  if [ $? -ne 0 ]; then
    echo "$FUNC : tr command failed" 1>&2
    return 2
  fi
  return 0
}

# LowerCase
# All lower case letters.
# Parameters:
#  $1 = string
# Returns:
#  all lower case letters.
#  $?=0 if successful.
#  $?>0 if failed.
LowerCase() {
  FUNC=LowerCase
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo "$1" | tr [:upper:] [:lower:]
  if [ $? -ne 0 ]; then
    echo "$FUNC : tr command failed" 1>&2
    return 2
  fi
  return 0
}

# Trim
# Remove the left side and right side white spaces.
# Parameters:
#  $1 = string
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
Trim() {
  FUNC=Trim
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo "$1" | sed -e 's|^[[:space:]]*||;s|[[:space:]]*$||'
  return 0
}

# LTrim
# Remove the left side white spaces.
# Parameters:
#  $1 = string
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
LTrim() {
  FUNC=LTrim
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo "$1" | sed -e 's|^[[:space:]]*||'
  return 0
}

# RTrim
# Remove the right side white spaces.
# Parameters:
#  $1 = string
# Returns:
#  string
#  $?=0 if successful.
#  $?>0 if failed.
RTrim() {
  FUNC=RTrim
  if [ $# -ne 1 ]; then
    echo "$FUNC : invalid argument" 1>&2
    return 1
  fi
  echo "$1" | sed -e 's|[[:space:]]*$||'
  return 0
}

# SAKURA_SH_VER
# display this scirpt version.
SAKURA_SH_VER() {
cat << EOS
sakura_common.sh : version $SAKURA_COMMON_SH_VERSION
Copyright 2016, IT SUPPORT SAKURA CO., Ltd.
EOS
}
