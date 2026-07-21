# Day 10 - Arrays, String Manipulation & Arithmetic Operations

## Learning Objectives

By the end of this session, you will be able to:

- Create and use arrays
- Access array elements
- Loop through arrays
- Manipulate strings
- Extract substrings
- Replace text in variables
- Perform arithmetic calculations
- Generate dynamic reports using Bash

---

# Arrays

An array stores multiple values in a single variable.

## Create an Array

```bash
servers=("web01" "web02" "db01")
```

## Print All Elements

```bash
echo "${servers[@]}"
```

Output:

```text
web01 web02 db01
```

---

## Print First Element

```bash
echo "${servers[0]}"
```

Output:

```text
web01
```

---

## Print Second Element

```bash
echo "${servers[1]}"
```

Output:

```text
web02
```

---

## Print Last Element

```bash
echo "${servers[2]}"
```

Output:

```text
db01
```

---

## Print Array Indexes

```bash
echo "${!servers[@]}"
```

Output:

```text
0 1 2
```

---

## Count Array Elements

```bash
echo "${#servers[@]}"
```

Output:

```text
3
```

---

## Loop Through Array

```bash
for server in "${servers[@]}"
do
    echo "$server"
done
```

Output:

```text
web01
web02
db01
```

---

## Loop Using Index

```bash
for i in "${!servers[@]}"
do
    echo "$i -> ${servers[$i]}"
done
```

Output:

```text
0 -> web01
1 -> web02
2 -> db01
```

---

## Add Element

```bash
servers+=("app01")
```

Verify:

```bash
echo "${servers[@]}"
```

Output:

```text
web01 web02 db01 app01
```

---

## Remove Element

```bash
unset servers[1]
```

Verify:

```bash
echo "${servers[@]}"
```

Output:

```text
web01 db01 app01
```

---

## Read Array from User

```bash
read -a servers

echo "${servers[@]}"
```

Input:

```text
web01 web02 db01
```

Output:

```text
web01 web02 db01
```

---

# String Operations

## Create String

```bash
name="Kishore Basuvappan"
```

---

## Display String

```bash
echo "$name"
```

Output:

```text
Kishore Basuvappan
```

---

## String Length

```bash
echo "${#name}"
```

Output:

```text
18
```

---

## Convert to Uppercase

```bash
echo "${name^^}"
```

Output:

```text
KISHORE BASUVAPPAN
```

---

## Convert to Lowercase

```bash
echo "${name,,}"
```

Output:

```text
kishore basuvappan
```

---

## Extract Substring

Syntax:

```bash
${variable:start:length}
```

Example:

```bash
name="Kishore"

echo "${name:0:4}"
```

Output:

```text
Kish
```

---

## Extract from Position

```bash
echo "${name:2}"
```

Output:

```text
shore
```

---

## Replace Text

```bash
text="Linux DevOps"
```

```bash
echo "${text/DevOps/AWS}"
```

Output:

```text
Linux AWS
```

---

## Replace All Occurrences

```bash
text="apple apple apple"

echo "${text//apple/mango}"
```

Output:

```text
mango mango mango
```

---

## Remove Prefix

```bash
file="/tmp/test.log"

echo "${file#/tmp/}"
```

Output:

```text
test.log
```

---

## Remove Suffix

```bash
echo "${file%.log}"
```

Output:

```text
/tmp/test
```

---

## String Contains

```bash
name="DevOps Engineer"

if [[ "$name" == *"Ops"* ]]
then
    echo "Match Found"
fi
```

Output:

```text
Match Found
```

---

# Arithmetic Operations

Arithmetic uses:

```bash
$(( ))
```

---

## Addition

```bash
echo $((10 + 20))
```

Output:

```text
30
```

---

## Subtraction

```bash
echo $((50 - 20))
```

Output:

```text
30
```

---

## Multiplication

```bash
echo $((10 * 5))
```

Output:

```text
50
```

---

## Division

```bash
echo $((100 / 10))
```

Output:

```text
10
```

---

## Modulus

```bash
echo $((10 % 3))
```

Output:

```text
1
```

---

# Arithmetic Using Variables

```bash
a=10
b=20

echo $((a+b))
```

Output:

```text
30
```

---

# Increment

```bash
count=1

((count++))

echo "$count"
```

Output:

```text
2
```

---

# Decrement

```bash
count=5

((count--))

echo "$count"
```

Output:

```text
4
```

---

# Compound Assignment

Increase:

```bash
((count+=5))
```

Decrease:

```bash
((count-=2))
```

Multiply:

```bash
((count*=2))
```

Divide:

```bash
((count/=2))
```

---

# Random Numbers

Generate Random Number:

```bash
echo $RANDOM
```

Output:

```text
25873
```

---

Generate Value Between 0 and 99

```bash
echo $((RANDOM%100))
```

Output:

```text
42
```

---

# Date Arithmetic

Current Year:

```bash
year=$(date +%Y)

echo "$year"
```

---

Calculate Age

```bash
birthyear=1990

echo $((year-birthyear))
```

---

# Real World Example

## Server Health Report

```bash
#!/bin/bash

servers=("web01" "web02" "db01")

for server in "${servers[@]}"
do
    echo "Checking $server"
done
```

---

## Count Log Files

```bash
files=(/var/log/*.log)

echo "Total Log Files: ${#files[@]}"
```

---

# Lab Exercises

## Lab 1

Create:

```bash
arraydemo.sh
```

Store three server names and print them.

---

## Lab 2

Create:

```bash
calculator.sh
```

Perform:

```text
Addition
Subtraction
Multiplication
Division
```

---

## Lab 3

Create:

```bash
stringops.sh
```

Display:

```text
Length
Uppercase
Lowercase
Substring
```

---

## Lab 4

Create:

```bash
serverreport.sh
```

Read array values and display a report.

---

# Important Commands

```bash
()

[@]

${array[@]}

${#array[@]}

unset

read -a

${#variable}

${variable:start:length}

${variable/old/new}

${variable//old/new}

${variable^^}

${variable,,}

$(( ))

((count++))

((count--))

RANDOM
```

---

# Interview Questions

### What is an array?

A collection of multiple values stored in one variable.

---

### How do you print all array values?

```bash
echo "${array[@]}"
```

---

### How do you count array elements?

```bash
echo "${#array[@]}"
```

---

### How do you get string length?

```bash
echo "${#variable}"
```

---

### How do you convert a string to uppercase?

```bash
echo "${var^^}"
```

---

### How do you replace text in a variable?

```bash
echo "${var/old/new}"
```

---

### How do you perform arithmetic operations in Bash?

```bash
echo $((10+20))
```

---

### What is RANDOM?

A built-in Bash variable used to generate random numbers.

---

# Git Commit

```bash
git add Day10/
git commit -m "Day 10 Arrays String Manipulation and Arithmetic"
git push origin main
```

---

# Day 10 Outcome

✅ Arrays

✅ Array Indexing

✅ Array Loops

✅ String Manipulation

✅ Substrings

✅ Search & Replace

✅ Uppercase & Lowercase Conversion

✅ Arithmetic Operations

✅ Increment & Decrement

✅ Random Number Generation

✅ Dynamic Bash Scripting
