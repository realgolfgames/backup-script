#!/bin/bash

# Load environment variables from .env file in the script's directory
if [[ -f "$(dirname "$0")/.env" ]]; then
    source "$(dirname "$0")/.env"
else
    echo "Error: .env file not found."
    exit 1
fi

# Get current timestamp in the desired format
timestamp=$(date "+%H-%M-%S")

# Create folders for the current year, month, and day
year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")

# Ensure the folders exist, create them if not
mkdir -p "backups/${year}/${month}/${day}"

# Run mongoexport command with timestamp in the output file name and store in the organized folder
mongoexport --uri "${MONGODB_URI}" --collection users --type JSON --out "backups/${year}/${month}/${day}/${timestamp}.json"
