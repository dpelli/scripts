#!/bin/bash

# current timestamp expressed in seconds
currentTS_paranthesis=$(date +%s)
echo $currentTS_paranthesis
# currentTS_backticks=`date +%s`
# echo $currentTS_backticks

# yesterday's TS
yesterdayTS=$(($currentTS_paranthesis - 24 * 60 * 60))
echo $yesterdayTS

# create file name
# backupFileName="backup-$currentTS_paranthesis.tar.gz"
# echo $backupFileName

# get absolute path
# curren_abs_path=`pwd`
# echo $curren_abs_path

# get destDirAbsPath
# destinationDirectory="$curren_abs_path/destinationDirectory"
# mkdir -p $destinationDirectory
# cd destinationDirectory
# destDirAbsPath=`pwd`
# echo $destDirAbsPath