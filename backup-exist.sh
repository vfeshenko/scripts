#!/bin/bash

cd /var/lib/vz/dump
VM=$1
if [ ! $1 ]; then
	VM=100
fi

[ -n "$(find vzdump-qemu-$VM-*.vma.lzo -type f 2>/dev/null)" ] && echo -e "\E[32m$(find vzdump-qemu-$VM-*.vma.lzo -type f)\E[0m" || echo -e "\E[31mNONE\E[0m"
