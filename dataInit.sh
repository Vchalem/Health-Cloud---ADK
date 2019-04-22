#!/bin/bash
#
# NOTE: This is intended to be run to load data into an org that was already initialized using orgInit.sh or other method
#

# Remove the post-processing output directory, in case there was one left from earlier run
rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -i data/preprocess

# Load the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan.json
