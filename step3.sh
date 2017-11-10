#!/bin/bash
File1="sshd_config"
File2="fstab"
File3="host.conf"
File4="sysctl.conf"
echo "Enter 1 if you ran step1.sh and step2.sh and have updated sshd_config.add"
read userInput
if [ $userInput -eq 1 ]; then
        echo "Ok. Proceeding to update $File1 $File2 $File3 $File4"
        cat $File1.add >> /etc/ssh/$File1
        cat $File2.add >> /etc/$File2
        cat $File3.add >> /etc/$File3
        cat $File4.add >> /etc/$File4
else
        echo "Please run step1.sh and step2.sh and update sshd_config.add"
fi
