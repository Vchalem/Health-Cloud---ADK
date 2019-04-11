#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK2 --setdefaultusername -d 1

./initExistingOrg.sh HCADK2

sfdx force:org:open