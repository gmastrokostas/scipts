if [[ -z $@ ]]; then
        echo "no args entered"
        echo " Valid options are: "
        echo "                systemctl reboot"
        echo "                systemctl poweroff"
        echo "                shutdown"
        echo "                reboot"
        exit
fi

ping_friends()
{
ping_1=`ping -c 1 -W 0.5  192.168.1.10 2>&1 >> /dev/null`
ping_2=`ping -c 1 -W 0.5  192.168.2.10 2>&1 >> /dev/null`
result=$?
if [[ $result -ne 0  ]]; then
        echo "iSCSI CLIENTS ARE STILL ACTIVE"
        echo "ABORTING REBOOT -- YOU WINDOWS MACHINE IS STILL UP";
        exit;
elif [[ $result -eq 0 ]]; then
        virsh_check=`virsh list --state-running --state-paused | egrep 'running|paused' 2>&1 >> /dev/null`
        vm_names=`virsh list --state-running --state-paused | awk '{print $2}' | grep -vie  '^[[:space:]]*$' | grep -v Name`

        echo "Shutting down any running VMs"
        echo "---------------------------------"
        for vm in `echo $vm_names`; do
                virsh shutdown $vm;
        done;
        echo "---------------------------------"

        i=0
        until (( i >=60 )); do
                virsh list --state-running --state-paused  |  grep '^[[:space:]][0-9]'
                if [[ $? -eq 0 ]]; then
                        sleep 2 && let i++ echo $i
                elif [[ $? -eq 1 ]]; then
                        echo "STEP 3 - REBOOTING"
                        echo "Moving along with reboot/shutdown";
                        $@
                        exit;
                        fi
        done


        #echo "NO iSCSI clients attached"
        #echo "Moving along with reboot/shutdown";
        #$@
fi
}

ping_friends $@
echo $?

