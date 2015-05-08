#!/bin/sh

args=("$@")

if [ "$#" -ne 3 ]; then
echo ERROR - Illegal Number of Parameters: Expect 3 Parameters, but $# is provided.
echo "USAGE: MPL.sh <Path/To/MPL.jar> <Path/To/YourJavaFile> <ClassNameOfTheMainFunction>"

else
javac -cp $1 $2
java -cp .:$1 $3
fi