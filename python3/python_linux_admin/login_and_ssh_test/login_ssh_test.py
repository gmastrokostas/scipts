import paramiko

#Create the ssh client
client = paramiko.SSHClient()

#ignore missing entries in known_hosts and add them automatically
client.set_missing_host_key_policy(paramiko.AutoAddPolicy)

list_hosts = ['centos1', 'hpv1-v', '192.168.1.128']
list_user = ['root', 'seeker', 'koukla', 'spidey']

failed_hosts = []
failed_logins = []

for hosts in list_hosts:
    try:
        for users in list_user:

            #Establich connection with the server
            client.connect(hostname=hosts, username=users, password='zxc123')
            #Execute a sudo command
            stdin, stdout, stderr = client.exec_command('sudo uptime')
            #Pass the password for sude
            stdin.write('zxc123')
            stdin.close()
            #surpress the paramiko output. We dont want it
            x=(stdout.read())
            # Close ssh connection
            client.close()
            #######
            #print("Login------DNS")
            #print(hosts, pto_login_status, pto_dns_status)

    except Exception as e:
        print(e, " for hostname", hosts, " and user(s)", users)
        failed_hosts.append(hosts)
        failed_logins.append(users)
        print(hosts, users)


