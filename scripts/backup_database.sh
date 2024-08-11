#!/bin/bash

# Database backup script for Ecolaura

# Configuration
DB_NAME="ecolaura"
DB_USER="ecolaura_user"
DB_PASSWORD="your_password_here"
BACKUP_DIR="/path/to/backup/directory"
RETENTION_DAYS=7

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Generate timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Perform backup
PGPASSWORD=$DB_PASSWORD pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/$DB_NAME\_$TIMESTAMP.sql

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup completed successfully: $BACKUP_DIR/$DB_NAME\_$TIMESTAMP.sql"
else
    echo "Error: Database backup failed"
    exit 1
fi

# Remove old backups
find $BACKUP_DIR -name "$DB_NAME\_*.sql" -mtime +$RETENTION_DAYS -delete

echo "Old backups removed. Backup process completed."