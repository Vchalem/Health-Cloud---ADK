#!/bin/bash

# Execute the plan to load the first batch of data items (uncomment if not already done)
# sfdx force:data:tree:import -u HCADK2 -p data/Plan1.json

# Remove the post-processing output directory, in case there was one left from earlier run
rm -rf data/preprocess.out

# Use the plug-in to convert the files with DeveloperName to SF ID's for this org
sfdx wry:file:replace -i data/preprocess

# Load the newly converted files from the output directory
sfdx force:data:tree:import -p data/Plan2.json
