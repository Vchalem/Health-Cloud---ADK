#!/bin/bash

# Include the comprehensive plan to load all data items
sfdx force:data:tree:import --plan data/Plan1.json

sfdx wry:file:replace -u HCADK2 -i data/preprocess

cp data/Account-plan.json data/preprocess.out/

sfdx force:data:tree:import -u HealthCloudScratchOrg -p data/preprocess.out/Account-plan.json

# Alternatively, load individual items, while working through them
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplate__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateProblem__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateGoal__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateTask__c-plan.json
#sfdx force:data:tree:import --plan data/Account-plan.json

sfdx force:apex:execute -f config/create-demo-data-setup.apex
#sfdx force:apex:execute -f config/create-demo-data.apex

sfdx force:org:open
