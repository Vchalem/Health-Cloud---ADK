#!/bin/bash

# Create the scratch org
sfdx force:org:create -f config/project-scratch-def.json -a HCADK2 --setdefaultusername -d 1

# Install the package
sfdx force:package:install --package 04t1C000000AoPO -w 20 

# Deploy the code
sfdx force:mdapi:deploy --deploydir mdapi-source/app-config
sfdx force:mdapi:deploy --deploydir mdapi-source/data-config
sfdx force:mdapi:deploy --deploydir mdapi-source/org-config
sfdx force:source:push 

# Assign the permissions
sfdx force:user:permset:assign -n HealthCloudPermissionSetLicense
sfdx force:user:permset:assign -n HealthCloudAdmin

# Execute the plan to load the first batch of data items
sfdx force:data:tree:import -p data/Plan1.json

# Install the plugin to handle RecordType Ids, in case it wasn't already installed.
#sfdx plugins:install sfdx-wry-plugin

# Remove the post-processing output directory, in case there was one left from earlier run
#rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -i data/preprocess

# Load the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan2.json

sfdx force:org:open
