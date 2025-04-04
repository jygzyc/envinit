#!/usr/bin/env bash
set -e

# Fetch the latest release version number from GitHub API
LATEST_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/releases/latest | grep '"tag_name":' | sed -E 's/.*"tag_name": "([^"]+)".*/\1/')

# Check if the version number was retrieved successfully
if [ -z "$LATEST_VERSION" ]; then
    echo "Failed to retrieve the latest version number. Please check your network connection or GitHub API availability!"
    exit 1
fi

# Display the latest version to the user
echo "The latest nvm version is: $LATEST_VERSION"

# Construct the URL with the latest version and install nvm
curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$LATEST_VERSION/install.sh" | bash

# Confirm installation completion
echo "nvm $LATEST_VERSION has been installed successfully."