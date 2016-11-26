#!/bin/bash
# UnixTime Sample

source ./../sakura_common.sh

# UNIX時間を表示します

# timezoneをUTCに設定
echo "timezone: UTC"
export TZ="UTC"

echo "現在のUnix Time"
UnixTime

echo "1970年1月1日のUnix Time"
UnixTime "1970/1/1"

echo "1970年1月1日 0時0分1秒 のUnix Time"
UnixTime "1970/1/1 00:00:01"
