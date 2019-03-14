#!/bin/bash

sfdx force:org:create -f config/project-scratch-def.json -a HCADK2 --setdefaultusername -d 1

sfdx force:package:install --package 04t1C000000AoPO -w 20 

sfdx force:mdapi:deploy --deploydir mdapi-source/app-config

sfdx force:mdapi:deploy --deploydir mdapi-source/data-config

sfdx force:mdapi:deploy --deploydir mdapi-source/org-config

sfdx force:source:push 

sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin

# Include the comprehensive plan in the future, when it all works
#sfdx force:data:tree:import --plan data/Plan1.json

# For now, do it as individual steps, to work through each
sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplate__c.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateProblem__c.json

sfdx force:apex:execute -f config/create-demo-data-setup.apex
#sfdx force:apex:execute -f config/create-demo-data.apex

sfdx force:org:open

