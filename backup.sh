#!/bin/bash

<<note
taking backup of files on everyday basis
note

timestamp=$(date '+%F_%H-%M-%S')
backup_dir="/home/ubuntu/backups/${timestamp}_backup.zip"

zip -r $backup_dir $1
#r- recursively include files and directories in the zip archive
#$1 - the first argument passed to the script, which is the directory or file to be backed up
echo "Backup of $1 completed successfully at $timestamp"


#to Automate this script, you can use cron jobs. You can add the following line to your crontab file to run the backup script every day at a specific time (e.g., 2 AM):
#0 2 * * * /path/to/backup.sh /path/to/directory_or_file_to_backup

#cron jobs are scheduled tasks that run automatically at specified intervals. The above line will execute the backup.sh script every day at 2 AM, creating a backup of the specified directory or file. Make sure to replace /path/to/backup.sh and /path/to/directory_or_file_to_backup with the actual paths on your system.

# -crontab -e
# select the vim editor and add the above line to the file. Save and exit the editor. The cron job will now be scheduled to run at the specified time.