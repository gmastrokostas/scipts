import glob
import os
from os.path import exists

root_path = glob.glob('/boot/loader/entries/*.conf')
root_path.sort(key=os.path.getatime)
bootloaderentries = "/boot/loader/entries/"
kernel_versions = []
confstring = ".conf"

if exists(bootloaderentries):
    full_kernel_string = ("\n".join(root_path).split("\n"))
else:
    exit()

for x in full_kernel_string:
    major = (x.split("-")[1])
    minor = (x.split("-")[2])
    kernel_string = major+minor.replace(confstring, "")
    kernel_versions.append(kernel_string)

kernels_indexed = enumerate(kernel_versions)
for x in kernels_indexed:
    print(x)