# Day 07 - Conditional Statements, Test Operators & Logical Operators

# Learning Objectives

By the end of Day 07, you should be able to:

- Make decisions in shell scripts
- Use if statements
- Use if-else statements
- Use elif statements
- Use nested if statements
- Understand test conditions
- Check files and directories
- Compare numbers
- Compare strings
- Use logical operators
- Write production-style validation scripts

---

# Why Conditions?

Without conditions:

```bash
echo "Backup Started"
```

With conditions:

```bash
if backup_exists
then
    restore_backup
fi
```

Conditions allow scripts to make decisions.

---

# Basic if Statement

Syntax:

```bash
if [ condition ]
then
    commands
fi
```

Example:

```bash
#!/bin/bash

if [ 10 -gt 5 ]
then
    echo "10 is greater"
fi
```

Output:

```text
10 is greater
```

---

# if-else

Syntax:

```bash
if [ condition ]
then
    commands
else
    commands
fi
```

Example:

```bash
#!/bin/bash

age=20

if [ "$age" -ge 18 ]
then
    echo "Adult"
else
    echo "Minor"
fi
```

Output:

```text
Adult
```

---

# if-elif-else

Syntax:

```bash
if [ condition ]
then
    commands

elif [ condition ]
then
    commands

else
    commands
fi
```

Example:

```bash
#!/bin/bash

marks=75

if [ "$marks" -ge 90 ]
then
    echo "Grade A"

elif [ "$marks" -ge 70 ]
then
    echo "Grade B"

else
    echo "Grade C"
fi
```

---

# Nested if

Example:

```bash
#!/bin/bash

age=25

if [ "$age" -ge 18 ]
then

    if [ "$age" -lt 60 ]
    then
        echo "Working Age"
    fi

fi
```

---

# Test Command

Both are same:

```bash
test 10 -gt 5
```

```bash
[ 10 -gt 5 ]
```

Check result:

```bash
echo $?
```

Output:

```text
0
```

---

# Numeric Comparison Operators

## Equal

```bash
[ "$a" -eq "$b" ]
```

---

## Not Equal

```bash
[ "$a" -ne "$b" ]
```

---

## Greater Than

```bash
[ "$a" -gt "$b" ]
```

---

## Less Than

```bash
[ "$a" -lt "$b" ]
```

---

## Greater or Equal

```bash
[ "$a" -ge "$b" ]
```

---

## Less or Equal

```bash
[ "$a" -le "$b" ]
```

---

# Examples

```bash
a=100
b=50

if [ "$a" -gt "$b" ]
then
    echo "A is greater"
fi
```

---

```bash
if [ "$a" -eq "$b" ]
then
    echo "Equal"
fi
```

---

# String Comparisons

## Equal

```bash
[ "$name" = "Kishore" ]
```

---

## Not Equal

```bash
[ "$name" != "John" ]
```

---

## String Empty

```bash
[ -z "$name" ]
```

---

## String Not Empty

```bash
[ -n "$name" ]
```

---

# Examples

```bash
name="Kishore"

if [ "$name" = "Kishore" ]
then
    echo "User Found"
fi
```

---

Empty string:

```bash
if [ -z "$name" ]
then
    echo "Empty Variable"
fi
```

---

# File Test Operators

These are heavily used in production scripts.

---

## File Exists

```bash
[ -f file.txt ]
```

Example:

```bash
if [ -f employees.txt ]
then
    echo "File Exists"
fi
```

---

## Directory Exists

```bash
[ -d /tmp ]
```

Example:

```bash
if [ -d logs ]
then
    echo "Directory Exists"
fi
```

---

## Path Exists

```bash
[ -e file.txt ]
```

---

## File Readable

```bash
[ -r file.txt ]
```

---

## File Writable

```bash
[ -w file.txt ]
```

---

## File Executable

```bash
[ -x script.sh ]
```

---

## File Size Greater Than Zero

```bash
[ -s file.txt ]
```

---

# Production Example

```bash
#!/bin/bash

FILE="/tmp/users.txt"

if [ -f "$FILE" ]
then
    echo "File Found"
else
    echo "File Missing"
fi
```

---

# Logical Operators

Very important.

---

# AND Operator (&&)

Run second command only if first succeeds.

```bash
mkdir backup && cd backup
```

---

Example:

```bash
ping google.com && echo "Network OK"
```

---

# OR Operator (||)

Run second command only if first fails.

```bash
cd backup || exit 1
```

---

Example:

```bash
ping wronghost || echo "Server Unreachable"
```

---

# Using AND Inside if

```bash
if [ "$age" -gt 18 ] && [ "$age" -lt 60 ]
then
    echo "Eligible"
fi
```

---

# Using OR Inside if

```bash
if [ "$city" = "Chennai" ] || [ "$city" = "Bangalore" ]
then
    echo "South India"
fi
```

---

# Combined Conditions

Example:

```bash
age=30
salary=70000

if [ "$age" -gt 18 ] && [ "$salary" -ge 50000 ]
then
    echo "Loan Eligible"
fi
```

---

# Double Brackets

Recommended modern syntax:

```bash
[[ condition ]]
```

Example:

```bash
if [[ "$name" == "Kishore" ]]
then
    echo "Match"
fi
```

---

# Checking Arguments

Example:

```bash
#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Provide Arguments"
    exit 1
fi

echo "Arguments Given"
```

Run:

```bash
./script.sh
```

Output:

```text
Provide Arguments
```

---

# Checking Root User

```bash
if [ "$EUID" -ne 0 ]
then
    echo "Run as root"
    exit 1
fi
```

Very common in administration scripts.

---

# Case Statement

Alternative to multiple if conditions.

Syntax:

```bash
case variable in

pattern)

commands
;;

pattern)

commands
;;

*)

default
;;

esac
```

---

# Example

```bash
#!/bin/bash

case "$1" in

start)

    echo "Starting Service"
    ;;

stop)

    echo "Stopping Service"
    ;;

restart)

    echo "Restarting Service"
    ;;

*)

    echo "Usage: start|stop|restart"
    ;;

esac
```

---

Run:

```bash
./service.sh start
```

Output:

```text
Starting Service
```

---

# Production Example

```bash
case "$ENV" in

dev)
    echo "Development"
    ;;

test)
    echo "Testing"
    ;;

prod)
    echo "Production"
    ;;

*)
    echo "Invalid Environment"
    ;;
esac
```

---

# Exit Codes

Successful execution:

```bash
exit 0
```

---

Failure:

```bash
exit 1
```

---

Example:

```bash
if [ ! -f config.txt ]
then
    echo "Missing Config"
    exit 1
fi
```

---

# Real Production Script

```bash
#!/bin/bash

LOGFILE="/var/log/syslog"

if [ ! -f "$LOGFILE" ]
then
    echo "Log File Missing"
    exit 1
fi

echo "Log File Found"
```

---

# Script Example 1

Age Validation

```bash
#!/bin/bash

read -p "Enter Age: " age

if [ "$age" -ge 18 ]
then
    echo "Eligible"

else
    echo "Not Eligible"
fi
```

---

# Script Example 2

Check File

```bash
#!/bin/bash

read -p "Enter File Name: " file

if [ -f "$file" ]
then
    echo "Exists"

else
    echo "Not Found"
fi
```

---

# Script Example 3

Server Health Check

```bash
#!/bin/bash

ping -c 1 google.com > /dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Server Reachable"
else
    echo "Network Issue"
fi
```

---

# Commands and Operators to Master

```bash
if
then
else
elif
fi

case
esac

test

-f
-d
-e
-r
-w
-x
-s

-z
-n

-eq
-ne
-gt
-lt
-ge
-le

&&
||

exit

$#
$?

[[ ]]
```

---

# Interview Questions

### Difference between if and case?

if:

```bash
if [ "$age" -gt 18 ]
```

Best for conditions.

case:

```bash
case "$1" in
```

Best for multiple choices.

---

### Difference between -f and -d?

```bash
-f
```

Checks file.

```bash
-d
```

Checks directory.

---

### Difference between && and ||?

```bash
&&
```

Execute on success.

```bash
||
```

Execute on failure.

---

### What is -z ?

Checks empty string.

---

### What is -n ?

Checks non-empty string.

---

### How do you check if a file exists?

```bash
[ -f filename ]
```

---

### How do you check if a directory exists?

```bash
[ -d dirname ]
```

---

### What does $# mean?

Number of arguments passed.

---

### What does $? mean?

Exit status of previous command.

---

# Lab Exercises

## Lab 1

Create:

```bash
checkfile.sh
```

Verify if file exists.

---

## Lab 2

Create:

```bash
checkdir.sh
```

Verify if directory exists.

---

## Lab 3

Create:

```bash
checkuser.sh
```

Accept username and compare against your name.

---

## Lab 4

Create:

```bash
service.sh
```

Using case:

```bash
start
stop
restart
```

---

# Git Commit

```bash
git add Day07/
git commit -m "Day 07 - Conditions and Case Statements"
```

Or

```bash
git add .
git commit -m "Day 07 Shell scripting conditions if else case"
git push origin main
```

---

# Day 07 Outcome

✅ if

✅ if-else

✅ elif

✅ nested if

✅ numeric comparisons

✅ string comparisons

✅ file test operators

✅ case statements

✅ logical operators

✅ exit codes

✅ production input validation

You can now understand a large portion of Linux administration scripts including backup scripts, log cleanup scripts, patching scripts, and monitoring scripts.
