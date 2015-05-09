#!/bin/sh

args=("$@")

if [ "$#" -ne 3 ]; then
echo ERROR - Illegal Number of Parameters: Expect 3 Parameters, but $# is provided.
echo "USAGE: MPL.sh <Path/To/MPL.sh>  <InputFilename.mpl> <OutputFilename>"
else
	$1MPL $2 $3
	javac -cp $1MPL.jar $3.java
	java -cp .:$1MPL.jar $3
fi