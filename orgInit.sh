#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK --setdefaultusername -d 1

# Install the package
sfdx force:package:install --package 04t1C000000Y1Qe -w 30 
# 216: --package 04t1C000000AoPO
# 218: --package 04t1C000000ApHp
# 220: --package 04t1C000000Apj5
# 222: --package 04t1C000000Y1Qe

#Install the unmanaged package extension
sfdx force:package:install --package 04tC0000001Eeby -w 30

# Deploy the metadata packages
sfdx force:mdapi:deploy --deploydir mdapi-source/app-config -w 20
sfdx force:mdapi:deploy --deploydir mdapi-source/org-config -w 20

# Deploy the source code (will only work in scratch orgs)
sfdx force:source:push -f -w 20

# Assign the permissions
sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin
sfdx force:user:permset:assign -n HealthCloudApi
sfdx force:user:permset:assign -n HealthCloudFoundation
sfdx force:user:permset:assign -n HealthCloudLimited
sfdx force:user:permset:assign -n HealthCloudMemberServices
sfdx force:user:permset:assign -n HealthCloudSocialDeterminants
sfdx force:user:permset:assign -n HealthCloudStandard
sfdx force:user:permset:assign -n HealthCloudUtilizationManagement

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
