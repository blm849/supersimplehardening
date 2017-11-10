#!/bin/bash
File1="sshd_config"
File2="fstab"
File3="host.conf"
File4="sysctl.conf"

echo "Ok. Proceeding to update $File1 $File2 $File3 $File4"
cp backup.$1.$File1 /etc/ssh/$File1
cp backup.$1.$File2 /etc/$File2
cp backup.$1.$File3 /etc/$File3
cp backup.$1.$File4 /etc/$File4
