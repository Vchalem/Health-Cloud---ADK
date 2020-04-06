#!/bin/bash

# Username parameter is optional
if [ "$#" -eq 0 ] 
then
	echo "No Org username or alias provided, will use current default"
else
	USERNAME=$1
    sfdx force:config:set defaultusername=$USERNAME
fi

# Install the package
sfdx force:package:install --package 04t1C000000go7o -w 30 
# 216: --package 04t1C000000AoPO
# 218: --package 04t1C000000ApHp
# 220: --package 04t1C000000Apj5
# 222: --package 04t1C000000Y1Qe
# 224: --package 04t1C000000go7o

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

./dataInit.sh