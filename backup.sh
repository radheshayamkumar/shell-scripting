#!/bin/bash

<<note
taking backup of files on everyday basis
note

timestamp=$(date '+%F_%H-%M-%S')
backup_dir="${timestamp}_backup.zip"

zip -r $backup_dir $1

echo "Backup of $1 completed successfully at $timestamp"