#Create/write/read a file
f = open('test.conf', 'w')
f.close()

f = open('test.conf', 'w')
f.write("Hello there\nhow is it going")
f.close

f = open('test.conf', 'r')
print(f.read())
f.close()
