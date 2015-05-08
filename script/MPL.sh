#!/bin/sh

args=("$@")

if [ "$#" -ne 2 ]; then
echo ERROR - Illegal Number of Parameters: Expect 3 Parameters, but $# is provided.
echo "USAGE: MPL.sh <Path/To/InputFilename.mpl> <Path/To/OutputFilename>"
else
./MPL $1 $2
javac -cp MPL.jar $2.java
java -cp .:MPL.jar $2
fi