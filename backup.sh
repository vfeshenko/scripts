#!/bin/bash
if [ -$# -eq 0 ]
then
	echo -e "\E[34mUsage: ./backup <VM_id>\E[0m"
	exit 1
fi

if [ -z "$(qm list | grep $1)" ]
then
	echo -e "\E[31mVM $1 does not exist\E[0m"
        exit 2
fi

TOTAL=$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9

echo -e "\E[32mSending shutdown message...\E[0m"
qm shutdown $1
echo -e "\E[32mOK\E[0m"
echo -e "\E[32mWaiting for shutdown VM...\E[0m"
while [[ $(qm status $1) != *"status: stopped"* ]]
do
 sleep 1
done
echo -e "\E[32mOK\E[0m"
echo -e "\E[32mStarting backup...\E[0m"
vzdump $1 --storage local --mode stop --compress lzo $TOTAL
echo -e "\E[32mOK\E[0m"
echo -e "\E[32mStarting VM...\E[0m"
qm start $1
echo -e "\E[32mOK\E[0m"
