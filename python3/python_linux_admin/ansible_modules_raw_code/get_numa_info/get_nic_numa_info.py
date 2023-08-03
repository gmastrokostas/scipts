import os.path
import re
from pathlib import Path
import os
if_path="/sys/class/net/"

regex_virtual="virtual"
numa_file_path="/device/numa_node"

pci_if_devices=[]
numa_info_list=[]
for entries in os.listdir(if_path):
    link_path=os.path.join(if_path, entries)
    if os.path.islink(link_path) is True:
        absolute_path=(Path(link_path).resolve())
        path_convert_to_string=(str(absolute_path))
        search_string=re.findall(regex_virtual, path_convert_to_string)
        #print(path_convert_to_string)
        if regex_virtual not in search_string:
            pci_ifs=path_convert_to_string+numa_file_path
            f_open = open(pci_ifs, "r")
            f_numa_value =f_open.read()
            #print(f_numa_value)
            pci_cards = path_convert_to_string, f_numa_value
            #pci_if_devices.append(pci_ifs+numa_file_path)
            for data in pci_cards:
                numa_info_list.append(data)
print(numa_info_list)






