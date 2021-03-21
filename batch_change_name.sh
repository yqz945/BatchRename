#!/bin/bash

CURRENT_DIR=$PWD
ENTRY_COUNT=`ls -l | awk '{if( $9 ) {print $9;}}'| wc -l`
ENTRYS=(`ls`)
FILES=('')
FILE_NAME=''
FILE_EXT=''
FILE_NAME_CHG=''
FILE_NAME_FIN=''

i=0
j=0
while [ $i -lt ${ENTRY_COUNT} ]
do

	if [ -d ${ENTRYS[$i]} ]
	then
		cd ${ENTRYS[$i]}
			
		FILES=(`ls`)

			while [ $j -lt ${#FILES[@]} ]
			do
				FILE_NAME=`echo ${FILES[$j]} | cut -d "." -f 1`	
           FILE_EXT=`echo ${FILES[$j]} | cut -d "." -f 2`
				
					# invoke python program to change the file name
           FILE_NAME_CHG=`python3 /mnt/c/Users/15871/tmp/find_change.py $FILE_NAME`
           if [ $FILE_NAME_CHG != "error" ]
           then
            #FILE_NAME_FIN=$FILE_NAME_CHG.$FILE_EXT
            mv ${FILES[$j]} $FILE_NAME_CHG.$FILE_EXT
           fi
				j=$[$j+1]
			done
			j=0

		cd $CURRENT_DIR
	fi
	
	i=$[$i+1]
done
