# Super simple hardening
A super simple way to harden your Ubuntu server.

## Introduction

I create alot of Ubuntu test servers, and I had a simple process to harden them. After doing this process for some time, I converted it into a number of simple Bash shell scripts that can be run in order to harden / further secure an Ubuntu server.

### Note 
You need to be root to run these scripts.

##### Step1.sh
This script adds a user that is part of the sudo and adm groups and let's you set a password.

##### Step2.sh
This script backs up files that will be changed in step 3. The backed up files will have a name of backup.yyyymmdd_hhmmss.filename

##### Step3.sh
Change files to make the server more secure.

##### Step3.reverse.sh
Reverse the files changed by step3.sh. You need to pass the backup prefix backup.yyyymmdd_hhmmss. Only run this if you feel something has gone wrong or if you want to reverse the changes made with step3.sh for any reason. 

##### Step4.sh
Runs the tail command against each of the changed files, so you can see that the changes have occurred after step3.sh. Or if you run this after running Step3.reverse.sh, you can see that the changes made have been reversed.

##### Step5.sh
Installs a number of software packages that can help make your system more secure. As well, it runs an update on all packages.





