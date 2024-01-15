#!/bin/bash

# Change the current working directory to the script's directory
cd "$(dirname "$0")"

# Load environment variables from .env file in the script's directory
if [[ -f .env ]]; then
    source .env
else
    echo "Error: .env file not found."
    exit 1
fi
# Prompt the user to enter the file path
read -p "Enter the file path of the backup file: " backup_file_path

# Check if the file exists
if [ ! -f "$backup_file_path" ]; then
    echo "Error: Backup file not found."
    exit 1
fi

# Run mongoimport command with the specified file path
mongoimport --uri "${MONGODB_URI}" --collection users --type JSON --file "$backup_file_path"
