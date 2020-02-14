#!/bin/bash
#
# NOTE: This is intended to be run to load data into an org that was already initialized using orgInit.sh or other method
#

# Perform any pre-steps, prior to loading data -- creates users..
#sfdx force:apex:execute -f config/create-demo-data-setup.apex

# Install the plugin to handle RecordType Ids, in case it wasn't already installed.
#sfdx plugins:install sfdx-wry-plugin

# Remove the post-processing output directory, in case there was one left from earlier run
#rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
#sfdx wry:file:replace -i data/preprocess

# Load the newly converted files from the output directory
#sfdx force:data:tree:import -p data/Plan.json

# Perform any post data tree import -- for assigning care plans to their owners..
#sfdx force:apex:execute -f config/create-demo-data.apex


#Output the RecordTypes of Account Object
sfdx force:data:soql:query -q "SELECT DeveloperName,Id,IsActive,SobjectType FROM RecordType where SobjectType='Account'" --json > ./data/preprocess/AccountRecordTypes.json

#Run JavaScript file to create a new file where the DeveloperName will be replaced with the SF ID of the current Org
node ./scripts/replaceRecordType.js Account

#Output the RecordTypes of Account Object
#sfdx force:data:soql:query -q "SELECT DeveloperName,Id,IsActive,SobjectType FROM RecordType where SobjectType='Contact'" --json > ./data/preprocess/ContactRecordTypes.json

#Run JavaScript file to create a new file where the DeveloperName will be replaced with the SF ID of the current Org
#node ./scripts/replaceRecordType.js Contact

#Output the RecordTypes of Case Object
sfdx force:data:soql:query -q "SELECT DeveloperName,Id,IsActive,SobjectType FROM RecordType where SobjectType='Case'" --json > ./data/preprocess/CaseRecordTypes.json

#Run JavaScript file to create a new file where the DeveloperName will be replaced with the SF ID of the current Org
node ./scripts/replaceRecordType.js Case


# Get Contact Name and IDs
sfdx force:data:soql:query -q "SELECT Id,Name FROM Contact" --json > ./data/preprocess/ContactWhoId.json

#Output the RecordTypes of Task Object
sfdx force:data:soql:query -q "SELECT DeveloperName,Id,IsActive,SobjectType FROM RecordType where SobjectType='Task'" --json > ./data/preprocess/TaskRecordTypes.json

#Run JavaScript file to create a new file where the DeveloperName will be replaced with the SF ID of the current Org
node ./scripts/replaceRecordType.js Task

# Load the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan4.json






