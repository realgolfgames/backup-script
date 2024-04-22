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
mkdir -p "../backup/ac-onr5u54-shard-00"
mkdir -p "../backup/ac-tl1blv7-shard-00"

# Run mongoexport command with timestamp in the output file name and store in the organized folder
mongoexport --uri="${MONGODB_URI_USERS}" --collection="users" --type="JSON" --out="../backup/ac-onr5u54-shard-00/${year}-${month}-${day}_${timestamp}.import.json"
mongoexport --uri="${MONGODB_URI_USERS}" --collection="users" --type="JSON" --out="../backup/ac-onr5u54-shard-00/${year}-${month}-${day}_${timestamp}.readable.json" --pretty
mongoexport --uri="${MONGODB_URI_COURSES}" --collection="courses" --type="JSON" --out="../backup/ac-tl1blv7-shard-00/${year}-${month}-${day}_${timestamp}.import.json"
mongoexport --uri="${MONGODB_URI_COURSES}" --collection="courses" --type="JSON" --out="../backup/ac-tl1blv7-shard-00/${year}-${month}-${day}_${timestamp}.readable.json" --pretty

# Wait for the export to complete
while pgrep -f "mongoexport" >/dev/null; do
    sleep 1
done