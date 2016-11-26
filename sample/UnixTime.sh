#!/bin/bash
# UnixTime Sample

source ./../sakura_common.sh

# Output Unix Time to stdout

echo "timezone: UTC"
export TZ="UTC"

echo "now Unix Time"
UnixTime

echo "1970/1/1 Unix Time"
UnixTime "1970/1/1"

echo "1970/1/1 00:00:01 Unix Time"
UnixTime "1970/1/1 00:00:01"
