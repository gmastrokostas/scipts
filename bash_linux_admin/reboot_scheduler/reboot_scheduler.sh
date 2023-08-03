Help()
{
   # Display Help
   echo "Schedule reboots depending on what week of the month it is."
   echo "-----------------------------------------------------------"
   echo "Syntax: scriptTemplate [-w|h|v]"
   echo "options:"
   echo "w     Each month has 4 weeks. Valid entries are 1,2,3,4."
   echo "h     Print this Help."
   echo
}

#if args is an empty string
if [[ -z $@ ]]; then
        echo "No Args given"
        echo "Valid options are"
        echo "          -w number of week"
	echo "          -h to view help info"
fi

#((($(date +%-d)-1)/7+1))

wom=$((($(date +%-d)-1)/7+1))
while getopts "w:h:p:" opt; do
        case $opt in
                w)
                  if [ "$OPTARG" -ne 1 ] && [ "$OPTARG" -ne 2  ] && [ "$OPTARG" -ne 3 ] &&  [ "$OPTARG" -ne 4 ]; then
                        echo "Error: A month has four weeks"
                        echo "Exiting"
                        exit;
                elif [ "$wom" -eq "$OPTARG" ]; then
                reboot
                fi
                ;;
	       *)
		 Help;
		 exit
		 ;;
       esac
done

