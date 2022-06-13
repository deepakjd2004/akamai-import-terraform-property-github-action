#!/bin/bash
set -o pipefail

# Create /root/.edgerc file from env variable
echo -e "${EDGERC}" > ~/.edgerc

#  Set Variables
propertyName=$1

mycommand="akamai terraform --accountkey ${secrets.AKAMAI_AS_ACCOUNTSWITCHKEY} create-property ${propertyName}"
eval $mycommand > output
cat output
