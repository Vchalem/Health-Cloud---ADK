#!/bin/bash

#create scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK2 --setdefaultusername -d 1

#pckg installs
sfdx force:package:install --package 04t1C000000AoPO -w 20 

sfdx force:source:push 


sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin

sfdx force:org:open

