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
sfdx force:package:install --package 04t1C000000AoPO -w 20 

# Deploy the metadata packages
sfdx force:mdapi:deploy --deploydir mdapi-source/app-config
# sfdx force:mdapi:deploy --deploydir mdapi-source/data-config
sfdx force:mdapi:deploy --deploydir mdapi-source/org-config

# Deploy the source code (will only work in scratch orgs)
sfdx force:source:push 

# Assign the permissions
sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin

# Perform any pre-steps, prior to loading data
# sfdx force:apex:execute -f config/create-demo-data-setup.apex

# Install the plugin to handle RecordType Ids, in case it wasn't already installed.
#sfdx plugins:install sfdx-wry-plugin

# Remove the post-processing output directory, in case there was one left from earlier run
rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -i data/preprocess

# Load the data. including the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan.json