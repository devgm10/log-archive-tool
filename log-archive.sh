#!/bin/bash

LOG_DIR="$1"
DEST_DIR="/home/gianm/archive"

# Check if an argument was provided
if [ -z "$LOG_DIR" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Validate that the directory exists
if [ -d "$LOG_DIR" ]; then
    echo "✔️ Valid directory: $LOG_DIR"

    timestamp=$(date +"%Y%m%d_%H%M%S")
    archive_name="logs_archive_${timestamp}.tar.gz"

    # Compress the log directory
    tar -czvf "$archive_name" "$LOG_DIR"

    # Move the compressed file to the destination directory
    mv "$archive_name" "$DEST_DIR/"

    echo "📦 Archive saved to: $DEST_DIR/$archive_name"

else
    echo "❌ Invalid directory: $LOG_DIR"
fi
