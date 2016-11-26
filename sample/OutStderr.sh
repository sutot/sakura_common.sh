#!/bin/bash
# OutStderr Sample

source ./../sakura_common.sh

# Output string to stderr.

OutStderr "message 1" > OutStderr.out
OutStderr "message 2" 2> OutStderr.out

echo "-- display OutStderr.out file --"
cat OutStderr.out
rm OutStderr.out
