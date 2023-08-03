host_name=`hostname`
os_info=`hostnamectl status  | grep 'Operating System'`
kernel=`hostnamectl status | grep -i kernel`
root_total=`df -h / | grep -v 'File' | awk '{print $2}'`
root_avail=`df -h / | grep -v 'File' | awk '{print $4}'`
cpu_cores=`nproc`
cpu_load=`uptime | awk '{print $8 " " $9 " " $10 " " $11 " " $12}'`
up_time=`uptime | awk '{print $3 " " $4}'`
last_reboot=`last reboot | head -n 1 | awk '{print $1 " " $2 " " $5 " " $6 " " $7 " " $8}'`
default_route=`ip route | grep default | awk '{print $3 " " $5}'`
#other_gateways=`route -n | grep -v '0.0.0.0' | awk '{print $8 " " $2}'`

#values that need to be converted into human readable
memory_total_raw=`grep MemTotal /proc/meminfo | awk '{print $2}'`
memory_avail_raw=`grep MemAvailable /proc/meminfo | awk '{print $2}'`
swap_total_raw=`grep SwapTotal /proc/meminfo | awk '{print $2}'`
swap_avail_raw=`grep SwapFree /proc/meminfo | awk '{print $2}'`

#values converted to human readable
memory_total=`numfmt --from-unit=1K  --to=si $memory_total_raw`
memory_avail=`numfmt --from-unit=1K  --to=si $memory_avail_raw`
swap_total=`numfmt --from-unit=1K  --to=si   $swap_total_raw`
swap_avail=`numfmt --from-unit=1K  --to=si   $swap_avail_raw`
########################################################################
echo "-----------"
echo "SYSTEM INFO"
echo "-----------"
echo "Hostname: $host_name"
echo "$os_info" |  sed -e 's/^[ \t]*//'
echo "$kernel"  | sed -e 's/^[ \t]*//'
echo "Uptime: ${up_time::-1}"
echo "Boot event: $last_reboot"
echo "Default route: $default_route"
echo ""
echo "-------------------------------"
echo "MEMORY  INFO"
echo "-------------------------------"
echo "Memory total: $memory_total"
echo "Memory avail: $memory_avail"
echo "-------------------------------"
echo ""
echo "-------------------------------"
echo " STORAGE INFO"
echo "-------------------------------"
echo "Swap total: $swap_total"
echo "Swap avail: $swap_avail"
echo "/ total: $root_total"
echo "/ avail: $root_avail"
echo ""
echo "-------------------------------"
echo "CPU INFO "
echo "-------------------------------"
echo "Num cores: $cpu_cores"
echo "CPU $cpu_load"
#echo "IFCG gateways" $other_gateways
