#!/bin/bash
cp /etc/ssh/sshd_config ~/backup.$(date +%Y%m%d_%H%M%S).sshd_config
cp /etc/fstab ~/backup.$(date +%Y%m%d_%H%M%S).fstab
cp /etc/host.conf ~/backup.$(date +%Y%m%d_%H%M%S).host.conf
cp /etc/sysctl.conf ~/backup.$(date +%Y%m%d_%H%M%S).sysctl.conf
