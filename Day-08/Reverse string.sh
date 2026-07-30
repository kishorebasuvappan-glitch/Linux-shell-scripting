#!/bin/bash

str="DevOps"
rev=""

for ((i=${#str}-1; i>=0; i--))
do
    rev="${rev}${str:$i:1}"
done

echo "Original: $str"
echo "Reversed: $rev"



#Methode -02

echo "DevOps" | rev