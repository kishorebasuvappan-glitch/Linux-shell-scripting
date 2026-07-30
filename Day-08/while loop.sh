#!/bin/bash

i=0

while ((i <= 1))
do
   echo "Number" "$i"
   printf "Number %d\n" "$i"
   ((i++))
done