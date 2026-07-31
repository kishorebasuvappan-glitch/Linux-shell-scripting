#!/bin/bash

read -p "Enter the number of rows " rows

for ((i=1; i<=rows; i++))
do
 
  for ((k=1; k<=rows; k++))

    do
      if ((i==3 && k==3 || i==2 && k==3 || i==1 && k==3 || i==4 && k==3 || i==5 && k==3 || i==3 && k==1 || i==3 && k==2 || i==3 && k==4 || i==3 && k==5)); then
          printf "*" 
      else 
          printf " "
       fi
    done
    printf "\n"
done