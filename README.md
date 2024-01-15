# MongoDB Backup Script

This Bash script automates the process of exporting data from a MongoDB collection and organizing the backups based on the current year, month, and day. Each backup file is named with a timestamp in the format HH-MM-SS and stored in a corresponding folder structure.

## Prerequisites

Before running the script, make sure to:

- Have MongoDB installed.
- Set up a MongoDB URI and store it in the `.env` file.
- Create a `.env` file with the following content:

  ```plaintext
  MONGODB_URI="your_mongodb_uri_here"
  ```

## Usage

1. Clone the repository:

```bash

git clone https://github.com/your-username/mongodb-backup-script.git
```

2. Navigate to the script directory:

```bash
cd mongodb-backup-script
```

3. Make the script executable:

```bash
chmod +x backup.sh
```

4. Run the script:

```bash
./backup.sh
```

This will export data from the specified MongoDB collection, create folders for the current year, month, and day, and store the backup file with a timestamp in the format HH-MM-SS.

## File Organization

Backups are organized in the following folder structure:

```
backups/
|-- YEAR/
|   |-- MONTH/
|       |-- DAY/
|           |-- HH-MM-SS.json

```

## License

This script is licensed under the [MIT License](./LICENSE.md).
