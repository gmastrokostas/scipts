#!/bin/bash
#This user detects if a user has logged in.

#Insert your restricted usernames
restricted_accounts=("seeker" "root" "seeker")
alarm_file="results.txt"
rm results.txt

send_alarm(){

#mutt -s "RESTRICTED USER LOGIN" seeker@hpv1-v
#user your favorite email client to send an email out

}


for names in "${restricted_accounts[@]}"
do
	users | grep $names > /dev/null 2>&1
	if [ $? -eq 0 ];
	then
		echo "Restricted user $names found"
		echo "Restricted user $names found" >> results.txt

	else
		continue
	fi
done

#Send email alarm if the result file is not empty.
if [ -e $alarm_file ];
then
       send_alarm
fi       
