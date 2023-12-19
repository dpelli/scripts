#!/bin/bash

# Check if the number of arguments is correct
# If the number of arguments is incorrect ( $# != 2) print error message and exit
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# Check if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

targetDirectory=$1
destinationDirectory=$2

echo "Target Directory: $targetDirectory"
echo "Destination Directory: $destinationDirectory"

currentTS=`date +%s`

backupFileName="backup-$currentTS.tar.gz"

# 1: Go into the target directory
# 2: Create the backup file
# 3: Move the backup file to the destination directory

origAbsPath=`pwd`
echo "Original Absolute Path: $origAbsPath"

cd $destinationDirectory
destAbsPath=`pwd`
echo "Destination Directory Absolute Path: $destAbsPath"


cd $origAbsPath
cd $targetDirectory

yesterdayTS=$(($currentTS - 24 * 60 * 60))

declare -a toBackup

for file in $(ls)
do
  file_last_modified_date=`date -r $file +%s`
  if (( $file_last_modified_date > $yesterdayTS ))
  then
    toBackup+=($file)
  fi
done

tar -czvf $backupFileName ${toBackup[@]}

mv $backupFileName $destAbsPath
