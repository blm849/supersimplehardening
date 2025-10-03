# Super simple hardening
A super simple way to make Ubuntu servers connected to the Internet somewhat more secure.

## Introduction


I create alot of Ubuntu test servers, and I wanted some way to make them more secure. I did alot of research on securing Ubuntu servers, and I boiled it down to a simple process to harden them. After doing this process for some time, I converted it into a number of simple Bash shell scripts that can be run in order to harden / further secure an Ubuntu server. The result is this repo.

## Warning

Before running these scripts, please read the license file that comes with these scripts.

Also note that these scripts address certain security risks that an Ubuntu server might have connected to the Internet. There are other risks that these scripts do not address. If in doubt, consult a Unix security expert before running these scripts.

## The Steps

### Note 
You need to be root to run these scripts.

Before you start running the steps, do the following

1. enter: cd /tmp
2. enter: apt-get -y update
3. enter: apt-get -y install git
4. enter: git clone https://github.com/blm849/supersimplehardening
5. enter: cd super*
6. enter: chmod +x *.sh

You are now ready to run the shell scripts step1.sh to step5.sh

##### Preliminary activities
Before running any scripts, replace the file /etc/issue.net with the contents of file __sample_issue_net_banner.txt__.

##### Step1.sh
Running this script adds a user that is goint to be part of the sudo and adm groups. This script also lets you set a password. You may want to add more than one userid. When you run this program, pass the name of the new user as a parameter. 

*	E.g., enter: ./step1.sh newuser

You will be prompted for a password for the new user, __newuser__

Once step1.sh runs successful, you can now log in to the system with the userid newuser. 

Consider adding a secondary user if you will have more than one user (e.g. a backup user)

*Do this now* before you run the next steps.

##### Step2.sh
Running this script backs up files that will be changed in step 3. The backed up files will have a name of backup.yyyymmdd_hhmmss.filename

Before running step3.sh, you will need to change the file 
__sshd_config.add__. There is a line in this file that starts with the word _AllowUsers_. For every user you created with step1.sh, list that user on this line.

*	E.g., if you added two users, newuser1 and newuser2, then the line should read: 
	* AllowUsers newuser1 newuser2
	
Check out __sshd_config.add__ for any other changes you want to do. If you are not sure
do __NOT__ uncomment a line.

##### Step3.sh
Running this script will change files to make the server more secure. It changes the following files:

*	/etc/ssh/sshd_config	- to prevent ssh login for root
*	/etc/fstab	- to secure shared memory
*	/etc/host.conf	- to prevent IP Spoofing
*	/etc/sysctl.conf	- to disable IPv6, ICMP and broadcast requests.


##### Step3.reverse.sh
Running this script will reverse the files changed by step3.sh. You need to pass the backup prefix backup.yyyymmdd_hhmmss attached to the backup files. Enter:

* To get the name of the backup prefix, enter: ls backup* 
	* you can see the prefix attached to files in your current directory

Only run this if you feel something has gone wrong or if you want to reverse the changes made with step3.sh for any reason. 

##### Step4.sh
Running this script runs the tail command against each of the changed files, so you can see that the changes have occurred after step3.sh. Or if you run this after running Step3.reverse.sh, you can see that the changes made have been reversed.

##### Step5.sh
Running this script installs a number of software packages that can help make your system more secure. Specifically it adds:
*	logwatch - a tool to scan your logs for security attacks
*	ufw - a software filewall
*	denyhosts - a tool to help with DDoS attacks
*	clamav and clamtk - antivirus software

I recommend running logwatch regularly and if you don't already have a firewall, then at least use ufw. Use Google/Bing/Duckduckgo to get more information on this tools. 

After the script adds those tool, it runs an update on all packages.


## Finally

After running all of these steps, restart sshd to prevent ssh login as root. But before you do, login to your server with root and at least one other new user that you create. 

*Before you restart the sshd, check the file one more time.*
Enter: sudo vi /etc/ssh/sshd_config

Ok, now to restart sshd, enter:

*	service ssh restart

or

* systemctl restart sshd (if you have a Red Hat or other server)

Now try and ssh to the server and login as root. You should be unsuccessful. However you should be able to ssh into the server as the newuser and then you should be able to use sudo to run the commands you need.

If you want to run a logwatch report to see what kind of attacks that people or machines are trying to run against your Ubuntu server, enter: 

* 	logwatch 

## One last note!

This approach has worked for me. It's far from the last word on Ubuntu server security, but it will help. If you have better approaches to securing your servers, stick with what you think is best.

## P.S. 
A number of steps here are taken from https://www.redhat.com/en/blog/eight-ways-secure-ssh

##### Ways 1-5 of the 8 ways are part of this process:
1. Backup the config file
2. Set a banner message
3. Prevent empty passwords
4. Prevent the root user from crossing the network via SSH
5. Whitelist specific user accounts

##### Ways 5-7 need manual effort.

6. No more port 22
7. Time's up! (i.e. forcing idle users)

##### After you change the port, you need to do these three commands (assuming you made it port 4222)
 sudo systemctl restart ssh.socket
sudo systemctl restart ssh.service
sudo ss -tuln | grep 4222

##### Way 8 depends on the version of Ubuntu you have 
8. Here's the key (i.e. using a key vs password for login)

##### If you have Ubuntu 22 or great, make sure file 
/etc/ssh/sshd_config.d/50-cloud-init.conf
has the following line:

PasswordAuthentication no





