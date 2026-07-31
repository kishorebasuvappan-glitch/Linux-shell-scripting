read -p "Enter the number of rows: " rows

#mid=$(( (rows + 1) / 2 ))

for ((i=1; i<=rows; i++))
do
    for ((k=1; k<=rows; k++))
    do
        if (( i == 3 || k == 3 )); then
            printf "*"
        else
            printf " "
        fi
    done
    printf "\n"
done