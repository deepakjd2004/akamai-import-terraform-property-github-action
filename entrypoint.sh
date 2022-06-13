#!/bin/bash
set -o pipefail

# Create /root/.edgerc file from env variable
echo -e "${EDGERC}" > ~/.edgerc

# SetVariables
propertyName=$1

mycommand="akamai terraform --accountkey $SWITCH_KEY create-property $propertyName"
eval $mycommand > output
cat output
status=$(cat output | grep 'statusCode' | awk '{print $2}' | tr -d ,)
if [ "$status" -eq "401" ] ; then
  echo "import command failed with: $output"
  exit 123
else
  echo "success"
fi
