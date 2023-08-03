if [ -z $1 ]
then
	echo "you did not enter a user name"
elif [ -n $1 ]
then
	until users | grep $1 
	do 
		sleep 1
		if [ $? -eq 0 ]
		then
			echo "User $1 is NOT logged in"
		elif [ $? -ne 0 ]
		then
			echo "User $1 is logged in "
			who | grep $1

		fi

	done

fi
