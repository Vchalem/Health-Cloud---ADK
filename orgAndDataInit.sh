#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK --setdefaultusername -d 1

./initExistingOrg.sh HCADK

sfdx force:org:open