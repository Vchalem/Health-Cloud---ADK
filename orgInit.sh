#!/bin/bash

sfdx force:org:create -f config/project-scratch-def.json -a HCADK2 --setdefaultusername -d 1

sfdx force:package:install --package 04t1C000000AoPO -w 20 

sfdx force:mdapi:deploy --deploydir mdapi-source/app-config

sfdx force:mdapi:deploy --deploydir mdapi-source/data-config

sfdx force:mdapi:deploy --deploydir mdapi-source/org-config

sfdx force:source:push 

sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin

# Include the comprehensive plan to load all data items
sfdx force:data:tree:import --plan data/Plan1.json

# Alternatively, load individual items, while working through them
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplate__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateProblem__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateGoal__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateTask__c-plan.json

sfdx force:apex:execute -f config/create-demo-data-setup.apex
#sfdx force:apex:execute -f config/create-demo-data.apex

sfdx force:org:open
