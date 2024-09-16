#!/bin/bash

# This checks if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
# Store directory names in variables to increase readability
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
# Display the target and destination directory
echo "Target directory: $targetDirectory"
echo "Destination directory: $destinationDirectory"

# [TASK 3]
# Save the current timestamp in seconds
currentTS=$(date +%s)

# [TASK 4]
# Create a variable for the backup filename
backupFileName="backup-$currentTS.tar.gz"

# We're going to:
  # 1: Go into the target directory
  # 2: Create the backup file
  # 3: Move the backup file to the destination directory

# To make things easier, we will define some useful variables...

# [TASK 5]
# Store the absolute path for the current directory
origAbsPath=$(pwd)

# [TASK 6]
# Go to detination dirctory and save its absolute path
cd destinationDirectory
destDirAbsPath=$(pwd)

# [TASK 7]
# Go into the target directory
cd $origAbsPath
cd $targetDirectory

# [TASK 8]
# Create a timestamp variable to compare modification dates of files
yesterdayTS=$(($currentTS - 24 * 60 * 60))

# Create an array of files to backup 
declare -a toBackup

# Iterate through all the file inside the target direcotry
for file in $(ls -r) # [TASK 9]
do
  # [TASK 10]
  # If modification date is less than a day then add file to toBackup array
  if (($(date -r $file +%s) > $yesterdayTS))
  then
    # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
# Compress and archive files
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
# Move backup file to destination directory
mv "$backupFileName" "$destDirAbsPath"
