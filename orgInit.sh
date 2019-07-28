#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK --setdefaultusername -d 1

# Install the package
sfdx force:package:install --package 04t1C000000Apj5 -w 30 
# 216: --package 04t1C000000AoPO
# 218: --package 04t1C000000ApHp
# 220: --package 04t1C000000Apj5

# Deploy the metadata packages
sfdx force:mdapi:deploy --deploydir mdapi-source/app-config
# sfdx force:mdapi:deploy --deploydir mdapi-source/data-config
sfdx force:mdapi:deploy --deploydir mdapi-source/org-config

# Deploy the source code (will only work in scratch orgs)
sfdx force:source:push -f

# Assign the permissions
sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin
#load users
#sfdx force:user:create --definitionfile config/user1-def.json
#sfdx force:user:create --definitionfile config/user2-def.json
#sfdx force:user:create --definitionfile config/user3-def.json
#sfdx force:user:create --definitionfile config/user4-def.json

# Perform any pre-steps, prior to loading data
#will set up the users..
#sfdx force:apex:execute -f config/create-demo-data-setup.apex

# Execute the plan to load the first batch of data items
# sfdx force:data:tree:import -p data/Plan1.json

# The final data loading steps are commented out, since they fail on Heroku
# If running locally, you can uncomment this line
# ./dataInit.sh

sfdx force:org:open
