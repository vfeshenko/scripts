#!/bin/bash
if [ -$# -eq 0 ] 
then 
        echo -e "\E[34mUsage: ./restore <VM_id>\E[0m"
        exit 1
fi

EXIST=$(exec backup-exist $1)
COUNT=$(echo -n "$EXIST" | grep -c '^')

if [[ $EXIST == $(echo -e "\E[31mNONE\E[0m") ]]
then
	echo -e "\E[31mVM $1 does not have backups\E[0m"
        exit 3
fi

DEPTH=1
if [[ ( $2 == "--depth" ) &&  ( $(($3)) == $3 ) && (( $3 -gt -1 )) && (( $3 -lt $COUNT )) ]]
then
	let "DEPTH += $3"
fi

cd /var/lib/vz/dump/
echo -e "\E[32mStoping VM...\E[0m"
qm stop $1
echo -e "\E[32mOK\E[0m"
BACKUP=$(find vzdump-qemu-$1-*.vma.lzo -type f -print0 | xargs -0 stat -c"%Y %n" | sort -k1,1nr | head -n $DEPTH | tail -n 1 |sed 's_^[^ ]\+ __')
echo -e "\E[32mStarting restore from $BACKUP...\E[0m"
qmrestore $BACKUP $1 -storage local --force
echo -e "\E[32mOK\E[0m"
echo -e "\E[32mStarting VM...\E[0m"
qm start $1
echo -e "\E[32mOK\E[0m"

