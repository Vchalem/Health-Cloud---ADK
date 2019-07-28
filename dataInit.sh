#!/bin/bash
#
# NOTE: This is intended to be run to load data into an org that was already initialized using orgInit.sh or other method
#

# Perform any pre-steps, prior to loading data -- creates users..
sfdx force:apex:execute -f config/create-demo-data-setup.apex

# Install the plugin to handle RecordType Ids, in case it wasn't already installed.
#sfdx plugins:install sfdx-wry-plugin

# Remove the post-processing output directory, in case there was one left from earlier run
rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -i data/preprocess

# Load the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan.json

# Perform any post data tree import -- for assigning care plans to their owners..
#sfdx force:apex:execute -f config/create-demo-data.apex
