#capture state of original ownership of files with this command
#find /home/    -printf "%u:%g %p\t\n" >> files

IFS=$'\n'
for loop in $(cat files);
do
own=`echo $loop | awk -F":" '{print $1}'`
grp=`echo $loop | awk -F":" '{print $2}' | cut -d " " -f 1`
f_path=`echo $loop | awk '{print $2}'`
chown $own:$grp $f_path
done

