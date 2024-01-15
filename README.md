# MongoDB Backup and Import Scripts

This repository provides Bash scripts for automating the export and import of data from a MongoDB collection. The backup script organizes backups based on the current year, month, and day, while the import script prompts the user to enter the file path of the backup file for importing.

## Prerequisites

Before using the scripts, make sure to:

- Have MongoDB installed.
- Set up a MongoDB URI and store it in the `.env` file.
- Create a `.env` file with the following content:

```plaintext
  MONGODB_URI="your_mongodb_uri_here"
```

## Backup Script Usage

1. Clone the repository:

```bash
git clone https://github.com/realgolf/backup-script.git
```

2. Navigate to the script directory:

```bash
cd mongodb-backup
```

3. Make the backup script executable:

```bash
chmod +x backup.sh
```

4. Run the backup script:

```bash
./backup.sh
```

This will export data from the specified MongoDB collection, create folders for the current year, month, and day, and store the backup file with a timestamp in the format HH-MM-SS.

## Import Script Usage

1. Navigate to the script directory:

```bash
cd mongodb-backup
```

2. Make the import script executable:

```bash
chmod +x import.sh
```

3. Run the import script:

```bash
./import.sh
```

This will prompt you to enter the file path of the backup file, and then it will import the data into the specified MongoDB collection.

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

This project is licensed under the [MIT License](./LICENSE.md).
