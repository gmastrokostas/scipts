import datetime
import psutil
import os
def uptime_linux():
    proc_uptime="/proc/uptime"
    read_proc=open(proc_uptime, 'r')
    rawuptime=(read_proc.read())
    split=uptime=rawuptime.split(' ')
    uptime=split[0]
    float_uptime=float(uptime)
    uptime=str(datetime.timedelta(seconds=float_uptime))
    return uptime
def cpu_info():
    num_of_cpus=os.cpu_count()
    return  num_of_cpus
def mem_info():
    swap_memory_total=psutil.swap_memory()[0]
    swap_memory_used=psutil.swap_memory()[1]
    swap_memory_free=psutil.swap_memory()[2]
    return swap_memory_total, swap_memory_used, swap_memory_free




#x=mem_info()
#print(x)

