#!/bin/bash
echo "/etc/ssh/sshd_config"
echo `tail -5 /etc/ssh/sshd_config`
echo
echo "/etc/fstab"
echo `tail -5 /etc/fstab`
echo
echo "/etc/host.conf"
echo `tail -5 /etc/host.conf`
echo
echo  "/etc/sysctl.conf"
echo  `tail -10 /etc/sysctl.conf`


