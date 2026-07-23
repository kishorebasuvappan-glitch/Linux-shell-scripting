#!/bin/bash

File=$(find . -type f -name "Day*" -mtime -5)
i=1
echo "$File" | while read -r file
do
    echo "File: $i:$file"
    ((i++))
done

