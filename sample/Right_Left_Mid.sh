#!/bin/bash
# Right, Left, Mid Sample

source ./../sakura_common.sh


STRING="1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ"

echo IN: $STRING
# Rigth
# Returns a string containing a specified number of characters
# from the right side of a string.
LEN=10
echo "Right $STRING $LEN"
Right $STRING 10

# Left
# Returns a string that contains a specified number of characters
# from the left side of a string.
LEN=15
echo "Left $STRING $LEN"
Left $STRING $LEN


# Mid
# Returns a string containing a specified number of characters
# from a string.
START=5
LEN=8
echo "Mid $STRING $START $LEN"
Mid $STRING $START $LEN

