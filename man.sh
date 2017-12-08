#!/bin/sh
while [ 0 ]
do

read -p "What command?: " COMMAND
CHECK=`which $COMMAND`

if [ -z "$CHECK" ];
        then
                echo "Command not found"
                continue
        else
                man $COMMAND > temp
fi

touch temp res

read -p "What option?: " OPTION
grep -EA1 "^ *$OPTION" temp > res

RES=`cat res`

if [ -z "$RES" ];
        then
                echo "Option not found"
        else
                echo "$RES"
fi

rm temp res

done
