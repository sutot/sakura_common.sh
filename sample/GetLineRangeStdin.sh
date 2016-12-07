#!/bin/bash
# GetLineRangeStdin Sample

source ./../sakura_common.sh

# Gets the line of the specified range from stdin.
# e.g.
#   cat /etc/hosts | GetLineRangeStdin 2 10

cat <<EOS | GetLineRangeStdin 2 4
line1
line2
line3
line4
line5
EOS
