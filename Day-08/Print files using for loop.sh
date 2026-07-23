#!/bin/bash

i=1

mapfile -t files < <(find . -type f -name "Day*" -mtime -5)

for file in "${files[@]}"
do
    echo "File $i: $file"
    i=$((i + 1))
done