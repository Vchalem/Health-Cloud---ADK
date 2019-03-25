#!/bin/bash

# Execute the plan to load the first batch of data items
sfdx force:data:tree:import --plan data/Plan1.json

# Install the plugin to handle RecordType Ids
sfdx plugins:install sfdx-wry-plugin

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -u HCADK2 -i data/preprocess

# Copy the Account-plan into the newly created directory with converted files
cp data/Account-plan.json data/preprocess.out/

# Load the newly converted files from the output directory
sfdx force:data:tree:import -u HealthCloudScratchOrg -p data/preprocess.out/Account-plan.json

# Alternatively, load individual items, while working through them
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplate__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateProblem__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateGoal__c-plan.json
#sfdx force:data:tree:import --plan data/HealthCloudGA__CarePlanTemplateTask__c-plan.json
#sfdx force:data:tree:import --plan data/Account-plan.json

sfdx force:apex:execute -f config/create-demo-data-setup.apex
#sfdx force:apex:execute -f config/create-demo-data.apex
