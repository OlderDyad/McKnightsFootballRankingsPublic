#!/bin/bash

# Check if the user has provided an argument for the next version
if [ -z "$1" ]; then
    echo "Usage: ./version-control.sh <new_version_name>"
    exit 1
fi

new_version=$1

# Step 1: Checkout to stable-release branch
git checkout stable-release

# Step 2: Merge development changes into stable-release
git merge development

# Step 3: Push the stable release
git push origin stable-release

# Step 4: Create a new development branch from stable-release
git checkout -b "$new_version"

# Step 5: Push the new development branch
git push -u origin "$new_version"

echo "New development version '$new_version' created successfully from stable-release."
