#!/bin/bash

check_pid()
{
	h=$(hostname -f)	
	systemctl_pid=`systemctl status $@ | grep 'Main PID' | awk '{print $3}'`
	MT_check=`lscpu | grep 'Thread(s) per core' | awk '{print $4}'`
	Sockets=`lscpu  | grep Socket  | awk '{print $2}'`
	cores=`lscpu  | grep 'CPU(s):'  | grep -v 'NUMA' |  awk '{print $2}'`


	if [ $MT_check -eq 1 ]; then
		MT_status="MTrheading disabled. Value: $MT_check"
	fi

	echo "---------------"
	echo hostname:  $h
	echo "---------------"
	echo $MT_status
	echo "Sockets: $Sockets"
	echo "Cores: $cores"
	echo "-----------------"
	echo ""
	echo "PID and CPU info"
	echo "$@ main pid is $systemctl_pid"
	tuna -t $@ -P
	taskset -pc $systemctl_pid
}

#We accept only one arg.
if [ $# -ne 1 ]; then
	echo "--------------------------------------"
	echo "Please enter ONE process/service name"
	echo "Example: ./pid_cpu_detect.sh httpd"
	echo "--------------------------------------"
	exit 1;
fi

#Check status of service
systemctl status $@  > /dev/null 2>&1


#Common systemctl return codes
#0: The operation was successful.
#1: The operation failed due to an unspecified error.
#2: The operation failed because the service is already in the requested state.
#3: The operation failed because the service could not be started or stopped.
#4: The operation failed because the requested service or unit was not found.
#5: The operation failed because the service is already enabled or disabled.


if [ $? -eq 0 ]; then
	check_pid $@;

else
	echo "Error: Service either:"
	echo "- Is not running"
	echo "- Does not exist"
	echo "- Or other systemctl error"
	exit 1;

fi

