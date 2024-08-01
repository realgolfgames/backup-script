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
mkdir -p "../backup/quizles"

# Get absolute paths
users_backup_dir="$(cd ../backup/users && pwd)"
courses_backup_dir="$(cd ../backup/courses && pwd)"
quizles_backup_dir="$(cd ../backup/quizles && pwd)"
blog_backup_dir="$(cd ../backup/blogs && pwd)"

# Debug output for directories
echo "Users backup directory: ${users_backup_dir}"
echo "Courses backup directory: ${courses_backup_dir}"
echo "Quizles backup directory: ${quizles_backup_dir}"
echo "Blog backup directory: ${blog_backup_dir}"

# Run mongoexport command with timestamp in the output file name and store in the organized folder
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="users" --type="JSON" --out="${users_backup_dir}/${year}/${month}/${day}/${timestamp}.import.json"
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="users" --type="JSON" --out="${users_backup_dir}/${year}/${month}/${day}/${timestamp}.readable.json" --pretty
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="quizles" --type="JSON" --out="${quizles_backup_dir}/${year}/${month}/${day}/${timestamp}.import.json"
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="quizles" --type="JSON" --out="${quizles_backup_dir}/${year}/${month}/${day}/${timestamp}.readable.json" --pretty
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="courses" --type="JSON" --out="${courses_backup_dir}/${year}/${month}/${day}/${timestamp}.import.json"
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="courses" --type="JSON" --out="${courses_backup_dir}/${year}/${month}/${day}/${timestamp}.readable.json" --pretty
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="blogs" --type="JSON" --out="${blog_backup_dir}/${year}/${month}/${day}/${timestamp}.import.json"
mongoexport --uri="mongodb+srv://moinjulian:${MONGODB_PASSWORD}@cluster0.w2umjjr.mongodb.net/prod?retryWrites=true&w=majority&appName=Cluster0" --collection="blogs" --type="JSON" --out="${blog_backup_dir}/${year}/${month}/${day}/${timestamp}.readable.json" --pretty

# Wait for the export to complete
while pgrep -f "mongoexport" >/dev/null; do
    sleep 1
done