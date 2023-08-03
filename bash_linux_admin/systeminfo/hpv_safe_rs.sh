#Check all remote hosts if they have running VMs.
for servers in `cat serverlist` 
do
	ssh -t $servers "sudo virsh list --state-running"
done
