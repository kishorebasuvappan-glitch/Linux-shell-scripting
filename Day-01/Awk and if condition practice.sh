#!/bin/bash

echo "My first bash script"
path="/workspaces/Linux-shell-scripting/Day-01"

if [ -d "$path" ]; then
   echo "path found"
   
   find "$path" -type f | awk -F "/" '{print $0}' >> new.csv
   find "$path" -type f | awk -F "/" '{print $1}' >> new.csv ## gives empty output due to /
   find "$path" -type f | awk -F "/" '{print $2}' >> new.csv
   find "$path" -type f | awk -F "/" '{print $3}' >> new.csv
   find "$path" -type f | awk -F "/" '{print $4}' >> new.csv
   find "$path" -type f | awk -F "/" '{print $5}' >> new.csv
   exit 0
else
   echo "path not found"
fi

