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

# Get current timestamp in the desired format
timestamp=$(date "+%H-%M-%S")

# Create folders for the current year, month, and day
year=$(date "+%Y")
month=$(date "+%m")
day=$(date "+%d")

# Ensure the folders exist, create them if not
mkdir -p "../backup/users"
mkdir -p "../backup/courses"

# Run mongoexport command with timestamp in the output file name and store in the organized folder
mongoexport --uri="${SECRET_MONGODB_CONNECTION}" --collection="users" --type="JSON" --out="../backup/users/${year}-${month}-${day}_${timestamp}.import.json"
mongoexport --uri="${SECRET_MONGODB_CONNECTION}" --collection="users" --type="JSON" --out="../backup/users/${year}-${month}-${day}_${timestamp}.readable.json" --pretty
mongoexport --uri="${SECRET_MONGODB_CONNECTION}" --collection="courses" --type="JSON" --out="../backup/courses/${year}-${month}-${day}_${timestamp}.import.json"
mongoexport --uri="${SECRET_MONGODB_CONNECTION}" --collection="courses" --type="JSON" --out="../backup/courses/${year}-${month}-${day}_${timestamp}.readable.json" --pretty

# Wait for the export to complete
while pgrep -f "mongoexport" >/dev/null; do
    sleep 1
done