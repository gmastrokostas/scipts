echo "Enter your root password to create the ansible user"
ansible  -m user -a 'name=ansible password="$6$nq6FEBB4NzhC8IVR$QLQfFgp7KI396NJIQkSTJb3IGI.TtQNAQZWxswyrsUMjkPBiMPjhcm2Kk7F9qTG1Yt8j2n/jp5RfoNHzCAYpX1"' -k -K -i inventory main -u root --become


echo "Enter your ansible password to create the .ssh directory and mode it to 700"
ansible -m file -a "state=directory path=/home/ansible/.ssh  mode=700" -k  -i inventory main -u ansible

echo "Enter your ansible password to create the authorized_keys file and mode it to 600"
ansible -m copy -a "src=/home/ansible/.ssh/id_rsa.pub   dest=/home/ansible/.ssh/authorized_keys mode=600" -k -i inventory main -u ansible

echo "Enter your root password to setup sudo no password for user ansible"
ansible -m shell -a 'echo "ansible ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers' -k -K --become -i inventory main -u root


