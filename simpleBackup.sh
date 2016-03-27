#!/bin/bash

#A helpfull script doesn't have to be big and complicated this program
#Will simply copy your documents and put them in a folder with your username and the time
#of the backup so you can keep an archive of your data changes 
#note some special character like ':' in then name of the file might not work correclty
#Created by Georgios Tsianakas

#add files or directories you want to back up
SOURCE=(" 
Add the directories you want can be more than one seperate with space eg /home/myName/Documents/
")

#backup destination
DEST="your destination external device eg /media/myName/myHardisc/AutoBackup/"

FILENAME=$USER"_"$(date +%d"-"%m"-"%Y"_"%H"."%M"."%S)
FINALDEST=$DEST$FILENAME

mkdir $FINALDEST

echo Backing your data this might take a while please dont remove backing device...

for i in "${SOURCE[@]}"
do
    cp -r $i $FINALDEST
done

echo Backup complete!

#shut down if -s flag need to be root
if [ "$1" == "-s" ]; then
   poweroff
fi
