#!/bin/bash

# Log rotation script for Ecolaura

# Configuration
LOG_DIR="/path/to/log/directory"
MAX_LOGS=7

# Ensure log directory exists
mkdir -p $LOG_DIR

# Get current date
CURRENT_DATE=$(date +"%Y%m%d")

# Rotate logs
for log in $LOG_DIR/*.log; do
    if [ -f "$log" ]; then
        mv "$log" "$log.$CURRENT_DATE"
    fi
done

# Compress logs older than 1 day
find $LOG_DIR -name "*.log.*" -mtime +1 -exec gzip {} \;

# Remove logs older than MAX_LOGS days
find $LOG_DIR -name "*.log.*.gz" -mtime +$MAX_LOGS -delete

echo "Log rotation completed."