#!/bin/bash
useradd -m -G sudo,adm -s /bin/bash $1
passwd $1
