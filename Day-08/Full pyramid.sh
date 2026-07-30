#!/bin/bash

read -p "Enter the number of rows: " rows

for ((i=1; i<=rows; i++))
do
    # Print spaces
    for ((j=i; j<rows; j++))
    do
        printf " "
       
    done
     # Print stars
    for ((k=1; k<=2*i-1; k++))
    do
        printf "*"
    done

    printf "\n"
done