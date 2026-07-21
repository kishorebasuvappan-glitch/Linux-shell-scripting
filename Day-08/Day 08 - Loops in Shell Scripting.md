# Day 08 - Loops in Shell Scripting (for, while, until, break, continue)

# Learning Objectives

By the end of Day 08, you should be able to:

- Automate repetitive tasks
- Use for loops
- Use while loops
- Use until loops
- Process files line-by-line
- Create menu-driven scripts
- Use break
- Use continue
- Loop through directories and files
- Build real-world DevOps automation scripts

---

# What is a Loop?

A loop executes the same block of code repeatedly.

Instead of writing:

```bash
echo "Server 1"
echo "Server 2"
echo "Server 3"
echo "Server 4"
```

Use:

```bash
for i in 1 2 3 4
do
    echo "Server $i"
done
```

---

# for Loop

Syntax:

```bash
for variable in list
do
    commands
done
```

---

# Example 1

```bash
for i in 1 2 3 4 5
do
    echo $i
done
```

Output:

```text
1
2
3
4
5
```

---

# Example 2

```bash
for name in John Alex David
do
    echo $name
done
```

Output:

```text
John
Alex
David
```

---

# Range Loop

```bash
for i in {1..10}
do
    echo $i
done
```

---

# Even Numbers

```bash
for i in {2..20..2}
do
    echo $i
done
```

Output:

```text
2
4
6
8
10
12
14
16
18
20
```

---

# C Style for Loop

Syntax:

```bash
for ((initialization; condition; increment))
do
    commands
done
```

Example:

```bash
for ((i=1;i<=5;i++))
do
    echo $i
done
```

---

# Loop Through Files

```bash
for file in *.txt
do
    echo "$file"
done
```

---

# Loop Through Directories

```bash
for dir in */
do
    echo "$dir"
done
```

---

# Real DevOps Example

```bash
for logfile in /var/log/*.log
do
    echo "$logfile"
done
```

---

# while Loop

Most used loop in Linux administration scripts.

Syntax:

```bash
while [ condition ]
do
    commands
done
```

---

# Example

```bash
count=1

while [ $count -le 5 ]
do
    echo $count
    count=$((count+1))
done
```

Output:

```text
1
2
3
4
5
```

---

# User Input Example

```bash
count=1

while [ $count -le 3 ]
do
    read -p "Enter name: " name
    echo "Hello $name"

    count=$((count+1))
done
```

---

# Read File Line By Line

Very important.

Create file:

```text
server1
server2
server3
```

Script:

```bash
while read -r server
do
    echo "Server: $server"
done < servers.txt
```

Output:

```text
Server: server1
Server: server2
Server: server3
```

---

# Real DevOps Example

```bash
while read -r server
do
    ping -c 1 "$server"
done < servers.txt
```

---

# until Loop

Runs until condition becomes TRUE.

Syntax:

```bash
until [ condition ]
do
    commands
done
```

---

# Example

```bash
count=1

until [ $count -gt 5 ]
do
    echo $count
    count=$((count+1))
done
```

Output:

```text
1
2
3
4
5
```

---

# Difference Between while and until

while:

```bash
while [ condition ]
```

Runs while condition is TRUE.

---

until:

```bash
until [ condition ]
```

Runs while condition is FALSE.

---

# break Statement

Stops loop immediately.

Example:

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        break
    fi

    echo $i
done
```

Output:

```text
1
2
3
4
```

---

# continue Statement

Skips current iteration.

Example:

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]
    then
        continue
    fi

    echo $i
done
```

Output:

```text
1
2
3
4
6
7
8
9
10
```

---

# Infinite Loop

Example:

```bash
while true
do
    echo "Running"
done
```

Stop:

```text
CTRL + C
```

---

# Sleep

Pause execution.

Example:

```bash
while true
do
    date
    sleep 5
done
```

Displays time every 5 seconds.

---

# Nested Loops

Example:

```bash
for i in {1..3}
do
    for j in {1..2}
    do
        echo "$i $j"
    done
done
```

Output:

```text
1 1
1 2
2 1
2 2
3 1
3 2
```

---

# Loop with Arrays

```bash
servers=("web01" "web02" "db01")
```

Loop:

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

# Processing Command Output

Example:

```bash
for user in $(cut -d: -f1 /etc/passwd)
do
    echo "$user"
done
```

---

# Find Files and Process

```bash
for file in *.log
do
    echo "Processing $file*
done
```

---

# Production Examp*e - Backup Cleanup

```bash
find /*ackup -mtime +30 | while read -r f*le
do
    echo "Deleting $file"
do*e
```

---

# Production Example - Service Check

```bash
for svc in nginx ssh docker
do
    systemctl is-active $svc
done
```

---

# Production Example - User Audit

```bash
while read -r user
do
    id "$user"
done < users.txt
```

---

# Script Example 1

Print numbers 1 to 10

```bash
#!/bin/bash

for i in {1..10}
do
    echo $i
done
```

---

# Script Example 2

Multiplication Table

```bash
#!/bin/bash

read -p "Enter Number: " num

for i in {1..10}
do
    echo "$num x $i = $((num*i))"
done
```

---

# Script Example 3

Directory Check

```bash
#!/bin/bash

for dir in logs backup config
do
    if [ -d "$dir" ]
    then
        echo "$dir Exists"
    else
        echo "$dir Missing"
    fi
done
```

---

# Script Example 4

Read Servers File

```bash
#!/bin/bash

while read -r server
do
    echo "Checking $server"
done < servers.txt
```

---

# Looping Through Arguments

```bash
for arg in "$@"
do
    echo "$arg"
done
```

Run:

```bash
./script.sh linux docker kubernetes
```

Output:

```text
linux
docker
kubernetes
```

---

# Commands and Concepts to Master

```bash
for

while

until

do

done

break

continue

sleep

true

false

$(( ))

$@

read -r
```

---

# Interview Questions

### Difference between for and while?

for:

```bash
for i in {1..10}
```

Used when number of iterations is known.

while:

```bash
while [ condition ]
```

Used when iterations depend on a condition.

---

### Difference between while and until?

while executes while condition is TRUE.

until executes while condition is FALSE.

---

### What does break do?

Stops loop immediately.

---

### What does continue do?

Skips current iteration.

---

### Why use read -r?

Prevents backslash interpretation.

Recommended for production scripts.

---

### How do you process a file line by line?

```bash
while read -r line
do
    echo "$line"
done < file.txt
```

---

### How do you loop through script arguments?

```bash
for arg in "$@"
do
    echo "$arg"
done
```

---

# Lab Exercises

## Lab 1

Create:

```bash
numbers.sh
```

Print:

```text
1 to 20
```

Using for loop.

---

## Lab 2

Create:

```bash
table.sh
```

Multiplication table.

---

## Lab 3

Create:

```bash
servercheck.sh
```

Read:

```text
servers.txt
```

Display all servers.

---

## Lab 4

Create:

```bash
cleanup.sh
```

Display all `.log` files using a loop.

---

## Lab 5

Create menu:

```text
1. Start
2. Stop
3. Exit
```

Use:

```bash
while
case
```

Together.

---

# Git Commit

```bash
git add Day08/
git commit -m "Day 08 - Loops in Shell Scripting"
```

Or:

```bash
git add .
git commit -m "Day 08 for while until break continue loops"
git push origin main
```

---

# Day 08 Outcome

✅ for loops

✅ C-style for loops

✅ while loops

✅ until loops

✅ break

✅ continue

✅ file processing loops

✅ argument processing

✅ nested loops

✅ automation patterns

✅ production-style looping

You can now understand and write most loop-based Linux administration scripts such as log cleanup, backup validation, user audits, service checks, and server health monitoring.
