#!/bin/bash
set -o pipefail

# Create /root/.edgerc file from env variable
echo -e "${EDGERC}" > ~/.edgerc

#  Set Variables
propertyName=$1


# check if propertyName exists
if [ -z "${propertyName}" ] ; then
  echo "Property name defined..this github action will proceed"
  mycommand1="akamai terraform --accountkey ${{secrets.AKAMAI_AS_ACCOUNTSWITCHKEY}} create-property ${propertyName}"
  echo "Running: $mycommand1"
  eval $mycommand1 > output1
  status="cat output1 | grep -i Fail"
    if  [-f $status] ; then
  echo "Operation failed with error..."
    fi
else
  echo -e "Error: ${propertyName} is missing.\nYou may want to define ${propertyName} into the workflow\n"
  exit 123
fi
