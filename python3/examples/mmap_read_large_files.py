import mmap
filename = "/home/seeker/stash/deleme.cnf"
#Search a file
with open (filename, 'r') as fo:
    s = mmap.mmap(fo.fileno(), length=0, access=mmap.ACCESS_READ)
    if s.find(b'hello') == 'hello there':
        print("Found")

#Read a file
with open (filename, mode='a', encoding="utf8") as fo:
    with mmap.mmap(fo.fileno(), length=0, access=mmap.ACCESS_READ) as mmap_obj:
        text = mmap_obj.read()
