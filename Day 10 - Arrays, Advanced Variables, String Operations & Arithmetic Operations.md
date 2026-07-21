# Day 10 - Arrays, Advanced Variables, String Operations & Arithmetic Operations

# Learning Objectives

By the end of Day 10, you should be able to:

- Create Arrays
- Read Array Values
- Loop Through Arrays
- Add and Remove Array Elements
- Work with Strings
- Extract Substrings
- Replace Text in Variables
- Perform Arithmetic Operations
- Create Dynamic Reports
- Build Real-World DevOps Scripts

---

# What are Arrays?

An array stores multiple values in a single variable.

Without array:

```bash
server1=web01
server2=web02
server3=db01
```

With array:

```bash
servers=("web01" "web02" "db01")
```

---

# Creating Arrays

```bash
servers=("web01" "web02" "db01")
```

---

# Print Entire Array

```bash
echo "${servers[@]}"
```

Output:

```text
web01 web02 db01
```

---

# Print First Element

```bash
echo "${servers[0]}"
```

Output:

```text
web01
```

---

# Print Second Element

```bash
echo "${servers[1]}"
```

Output:

```text
web02
```

---

# Print Last Element

```bash
echo "${servers[2]}"
```

Output:

```text
db01
```

---

# Display Index Numbers

```bash
echo "${!servers[@]}"
```

Output:

```text
0 1 2
```

---

# Number of Elements

```bash
echo "${#servers[@]}"
```

Output:

```text
3
```

---

# Loop Through Array

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

# Loop Using Index

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

# Add Array Element

```bash
servers+=("app01")
```

View:

```bash
echo "${servers[@]}"
```

Output:

```text
web01 web02 db01 app01
```

---

# Remove Element

```bash
unset servers[1]
```

Output:

```text
web01 db01 app01
```

---

# Read Array Input

```bash
read -a servers
```

Input:

```text
web01 web02 db01
```

Display:

```bash
echo "${servers[@]}"
```

---

# String Variables

```bash
name="Kishore Basuvappan"
```

Display:

```bash
echo "$name"
```

---

# String Length

```bash
echo "${#name}"
```

Output:

```text
18
```

---

# Convert to Uppercase

```bash
echo "${name^^}"
```

Output:

```text
KISHORE BASUVAPPAN
```

---

# Convert to Lowercase

```bash
echo "${name,,}"
```

Output:

```text
kishore basuvappan
```

---

# Extract Substring

Syntax:

```bash
${variable:start:length}
```

Example:

```bash
name="Kishore"
```

```bash
echo "${name:0:4}"
```

Output:

```text
Kish
```

---

# Extract From Position

```bash
echo "${name:2}"
```

Output:

```text
shore
```

---

# Replace Text

```bash
name="Linux DevOps"
```

```bash
echo "${name/DevOps/AWS}"
```

Output:

```text
Linux AWS
```

---

# Replace All Occurrences

```bash
text="apple apple apple"
```

```bash
echo "${text//apple/mango}"
```

Output:

```text
mango mango mango
```

---

# Remove Prefix

```bash
file="/tmp/test.log"
```

```bash
echo "${file#/tmp/}"
```

Output:

```text
test.log
```

---

# Remove Suffix

```bash
echo "${file%.log}"
```

Output:

```text
/tmp/test
```

---

# Check String Contains

```bash
name="DevOps"
```

```bash
if [[ "$name" == *"Ops"* ]]
then
   echo "Found"
fi
```

---

# Arithmetic Operations

---

## Addition

```bash
echo $((10+20))
```

Output:

```text
30
```

---

## Subtraction

```bash
echo $((50-20))
```

Output:

```text
30
```

---

## Multiplication

```bash
echo $((10*5))
```

Output:

```text
50
```

*--

## Division

```bash
echo $((1*0/10))
```

Output:

```text
10
``*

---

## Modulus

```bash
echo $(*10%3))
```

Output:

```text
1
```*
---

# Variables in Arithmetic

`*`bash
a=10
b=20

echo $((a+b))
```*
Output:

```text
30
```

---

# I*crement

```bash
count=1

((count+*))

echo "$count"
```

Output:

``*text
2
```

---

# Decrement

```b*sh
count=5

((count--))

echo "$co*nt"
```

Output:

```text
4
```

-*-

# Compound Operations

```bash
*(count+=5))
```

```bash
((count-=*))
```

```bash
((count*=2))
```

*--

# Random Numbers

Generate ran*om number:

```bash
echo $RANDOM
`*`

Example:

```text
25873
```

--*

Generate range:

```bash
echo $(*RANDOM%100))
```

Output:

```text*0-99
```

---

# Date Arithmetic

*urrent year:

```bash
year=$(date *%Y)

echo "$year"
```

---

Calcul*te age:

```bash
birthyear=1990

e*ho $((year-birthyear))
```

---

#*Combining Arrays and Loops

```bas*
servers=("web01" "web02" "db01")
*``

```bash
for server in "${serve*s[@]}"
do
    echo "Checking $serv*r"
done
```

---

# Script Example*1

Server List

```bash
#!/bin/bas*

servers=("web01" "web02" "db01")*
for server in "${servers[@]}"
do
*   echo "$server"
done
```

---

#*Script Example 2

Sum of Numbers

*``bash
#!/bin/bash

read -p "First*Number: " a
read -p "Second Number* " b

echo "Sum = $((a+b))"
```

-*-

# Script Example 3

String Anal*zer

```bash
#!/bin/bash

read -p *Enter Text: " text

echo "Length: *{#text}"

echo "Upper: ${text^^}"
*echo "Lower: ${text,,}"
```

---

* Script Example 4

Array and Loop
*```bash
#!/bin/bash

users=("admin* "devops" "cloud")

for user in "$*users[@]}"
do
    echo "$user"
don*
```

---

# Production Example

G*nerate Server Report

```bash
#!/b*n/bash

servers=("web01" "web02" "*b01")

echo "Server Report"

for s*rver in "${servers[@]}"
do
    ech* "Checking $server"
done
```

---
*# Production Example

Count Log Fi*es

```bash
files=(/var/log/*.log)*
echo "Log Files: ${#files[@]}"
``*

---

# Commands and Features to *aster

```bash
()

[@]

[#]

unset*
read -a

${#var}

${var:0:4}

${v*r/old/new}

${var//old/new}

${var*^}

${var,,}

$(( ))

((++))

((--*)

RANDOM
```

---

# Interview Qu*stions

### What is an Array?

A v*riable that stores multiple values*

---

### How do you print all ar*ay elements?

```bash
echo "${arra*[@]}"
```

---

### How do you cou*t array elements?

```bash
echo "$*#array[@]}"
```

---

### How do y*u get string length?

```bash
echo*"${#variable}"
```

---

### How d* you convert text to uppercase?

`*`bash
echo "${var^^}"
```

---

##* How do you replace text in a vari*ble?

```bash
echo "${var/old/new}*
```

---

### How do you perform *rithmetic in Bash?

```bash
echo $*(10+20))
```

---

### What is RAN*OM?

Built-in variable that generates random numbers.

---

# Lab Exercises

## Lab 1

Create:

```bash
arraydemo.sh
```

Store:

```text
3 server names
```

Print all values.

---

## Lab 2

Create:

```bash
calculator.sh
```

Perform:

```text
+
-
*
/
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

Read server array and print report.

---

# Git Commit

```bash
git add Day10/
git commit -m "Day 10 Arrays Strings and Arithmetic Operations"
```

Or:

```bash
git add .
git commit -m "Day 10 advanced bash variables arrays and arithmetic"
git push origin main
```

---

# Day 10 Outcome

✅ Arrays

✅ Array Loops

✅ String Manipulation

✅ String Search & Replace

✅ Substrings

✅ Arithmetic Operations

✅ Increment/Decrement

✅ Random Numbers

✅ Dynamic Data Processing

✅ Production-Style Bash Techniques

You can now build more advanced shell scripts that manage users, servers, logs, backups, and reports dynamically.
