#!/bin/sh

clear

if [ $(dpkg-query -W -f='${Status}' fortune >/dev/null 2>&1 | grep -c "ok installed") -eq 0 ];
then
  apt-get install fortune-mod >/dev/null 2>&1;
fi

while [ 0 ]
do
        echo 'MENU'
        echo '1. List all directories'
        echo '2. Date'
        echo '3. Print Working Directory'
        echo '4. Users Login'
        echo '5. Ping Google'
        echo '6. #### Choose your Fortune ####'

        echo ''
        echo 'Press "q" to exit'
        echo ''
        read -p 'Please enter your choice: ' VAR

        case $VAR in

                1)      ls -al > list
                        cat list
                        rm list
                        ;;
                2) echo `date`

                        ;;
                3) echo `pwd`
                        ;;
                4)      w > userslogin
                        cat userslogin
                        rm userslogin
                        ;;
                5) ping google.com -c 3
                        ;;
                6)

                        echo "########### Your Fortune Here ##############\n"
                        fortune
                        echo "\n############################################"

                        ;;
                "q") echo "Goodbye!"
                     exit
                        ;;

                *) echo "You've entered invalid choice"
                        ;;
        esac
done
