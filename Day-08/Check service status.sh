#!/bin/bash

sed '/dhsabalcs/q' hostfiles.txt | while read -r hostname
do
    echo "Checking: $hostname"

    if ping -c 2 "$hostname" > /dev/null 2>&1
    then
        echo "$hostname is Reachable"
        VM_Reachable="Reachable"
        echo "check zabbix status"
        sudo service zabbix-agent status | grep -i "running" > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
            echo "Zabbix is running fine"
            Zabbix_status="runnig"
        else
            echo "Zabbix is NOT running"
            Zabbix_status="Not Running"
        fi 
    else
        echo "$hostname is NOT Reachable"
        VM_Reachable="Not Reachable"
    fi
  echo "-------------------------"
printf "%s,%s,%s\n" "$hostname" "$VM_Reachable" "$Zabbix_status" >> Zabbix_agent_status.csv
done  


    