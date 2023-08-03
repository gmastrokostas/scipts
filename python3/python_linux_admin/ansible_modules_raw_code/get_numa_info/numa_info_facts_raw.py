from os.path import exists
import os

root_path = "/sys/class/net/"
numa_interface_path = "device/numa_node"
list_of_dicts = []
for root, dirs, files in os.walk(root_path):
    for interface in dirs:
        inter_path = os.path.join(root, interface)
        full_path = os.path.join(inter_path, numa_interface_path)
        if exists(full_path) is False:
            continue
        else:
            with open(full_path) as file:
                numa_info = file.read()
                dict_interaces = {
                    interface : {
                        "domain" : numa_info
                        }
                }
                list_of_dicts.append(dict_interaces)

print(list_of_dicts)




