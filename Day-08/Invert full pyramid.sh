#!/bin/bash

read -p "Enter the number of rows: " rows

for ((i=rows; i>=1; i--))
do
    # Print spaces
    for ((k=rows; k>i; k--))
    do
        printf " "
    done

    # Print stars
    for ((j=1; j<=2*i-1; j++))
    do
        printf "*"
    done

    printf "\n"
done