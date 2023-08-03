#ATTENTION -- You need to round up the numbers displayed
import os
import stat
bytes = 100
klobytes = 1000
megabytes = 1000000
gigabytes = 1000000000
terabytes = 1000000000000
get_c_dir = input("Enter full path")
x_status = os.access(get_c_dir, os.X_OK)

if x_status == False:
    print(get_c_dir, "Top directory Cannot be accessed. Quiting")
    exit()

def convert_to_mbs(m_size):
    if m_size < 0.1:
        unit = "KBS"
        m_size = m_size * 1024, unit
    elif m_size > 1 and m_size < gigabytes:
        unit = "MBS"
        m_size = m_size, unit
    elif m_size >gigabytes and m_size < terabytes:
        unit = "GBS"
        m_size = m_size, unit
    elif m_size > terabytes:
        unit = "TBS"
        m_size = m_size, unit
    return m_size

def check_x(f_path):
    #ATTENTION
    #You need to insert a check to see if it is a directory
    #otherwise it will mark all other regular files with no X as not accessible.
    x_status = os.access(f_path, os.X_OK)
    if x_status == False:
        print(f_path, "Directory Cannot be accessed. Skipping")


for root, dirs, files in os.walk(get_c_dir, followlinks=False):
    for f in files:
        (root + "/" +f)
        f_path = root + "/" + f
        check_x(f_path)
        #ATTENTION insert a check here to check
        #if a file exists or not.
        f_raw_size = os.path.getsize(f_path)
        stats = os.stat(f_path)
        b_size = (stats.st_size)
        if b_size < bytes:
            print(f_path, b_size, "Bytes")
        # If less than a Gigabyte convert it to MB
        elif b_size < gigabytes:
            #Convert bites to Megabytes
            m_size = b_size / 1048576
            new_m_size=(convert_to_mbs(m_size))
            print(f_path, new_m_size)
        # If less than a TB convert it to a GB
        elif b_size < terabytes:
            #Convert bytes to Gigabytes
            g_size = b_size / 1073741824
            print(f_path, g_size, "GBs")
