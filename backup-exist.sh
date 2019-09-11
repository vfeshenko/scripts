#!/bin/bash

cd /var/lib/vz/dump
[ -n "$(find vzdump-qemu-$1-*.vma.lzo -type f 2>/dev/null)" ]  && echo -e "\E[32m$(find vzdump-qemu-$1-*.vma.lzo -type f)\E[0m" ||  echo -e "\E[31mNONE\E[0m"
