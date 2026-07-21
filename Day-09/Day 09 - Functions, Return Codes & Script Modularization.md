# Day 09 - Functions, Return Codes & Script Modularization

# Learning Objectives

By the end of Day 09, you should be able to:

- Create Functions
- Call Functions
- Pass Arguments to Functions
- Return Values
- Use Exit Codes
- Reuse Code
- Create Modular Scripts
- Implement Error Handling
- Build Real-World DevOps Scripts

---

# What is a Function?

A function is a reusable block of code.

Instead of writing:

```bash
echo "Starting Backup"
echo "Backup Complete"

echo "Starting Backup"
echo "Backup Complete"
```

Multiple times, create a function.

---

# Basic Function Syntax

Method 1

```bash
function_name() {

    commands

}
```

Example:

```bash
hello() {

    echo "Hello DevOps"

}
```

Call function:

```bash
hello
```

Output:

```text
Hello DevOps
```

---

# Alternative Syntax

```bash
function hello {

    echo "Hello DevOps"

}
```

---

# Real Example

```bash
#!/bin/bash

greet() {

    echo "Welcome to Shell Scripting"

}

greet
```

Output:

```text
Welcome to Shell Scripting
```

---

# Multiple Functions

```bash
#!/bin/bash

start_app() {

    echo "Application Started"

}

stop_app() {

    echo "Application Stopped"

}

start_app
stop_app
```

---

# Function Parameters

Functions can receive arguments.

---

Example

```bash
greet() {

    echo "Hello $1"

}

greet Kishore
```

Output:

```text
Hello Kishore
```

---

# Multiple Parameters

```bash
employee() {

    echo "Name : $1"
    echo "Role : $2"

}

employee Kishore DevOps
```

Output:

```text
Name : Kishore
Role : DevOps
```

---

# Local Variables

Without local:

```bash
name="Global"

show() {

    name="Local"

}

show

echo $name
```

Output:

```text
Local
```

---

Using local:

```bash
name="Global"

show() {

    local name="Local"

    echo $name

}

show

echo $name
```

Output:

```text
Local
Global
```

---

# Return Code

Functions usually return:

```bash
0
```

Success

or

```bash
1
```

Failure

---

Example

```bash
check_file() {

    if [ -f "$1" ]
    then
        return 0
    else
        return 1
    fi

}
```

---

Use Return Code

```bash
check_file data.txt

echo $?
```

Output:

```text
0
```

or

```text
1
```

---

# Understanding return

This is wrong:

```bash
return "Kishore"
```

Return is only for:

```bash
0 - 255
```

---

Correct:

```bash
return 0
```

---

# Returning Values

Return output using:

```bash
echo
```

Example:

```bash
get_date() {

    echo $(date)

}
```

Capture:

```bash
today=$(get_date)

echo $today
```

---

# Example

```bash
sum() {

    echo $(($1+$2))

}
```

Capture:

```bash
result=$(sum 10 20)

echo $result
```

Output:

```text
30
```

---

# Exit Command

Exit script.

```bash
exit
```

---

Success

```bash
exit 0
```

---

Failure

```bash
exit 1
```

---

# Exit Status

Every command returns a code.

---

Success:

```bash
0
```

---

Failure:

```bash
Non-zero
```

---

Check:

```bash
ls

echo $?
```

Output:

```text
0
```

---

Invalid command:

```bash
abc

echo $?
```

Output:

```text
127
```

---

# Common Exit Codes

```text
0     Success
1     General Error
2     Incorrect Usage
126   Permission Issue
127   Command Not Found
130   Ctrl + C
```

---

# Error Handling

Example:

```bash
cp file1.txt backup/
```

Check:

```bash
if [ $? -eq 0 ]
then
    echo "Copy Successful"
else
    echo "Copy Failed"
fi
```

---

# Better Approach

```bash
cp file1.txt backup/

status=$?

if [ $status -eq 0 ]
then
    echo "Success"
else
    echo "Failed"
fi
```

---

# Using Functions for Validation

Example:

```bash
check_user() {

    id "$1" >/dev/null 2>&1

    if [ $? -eq 0 ]
    then
        return 0
    else
        return 1
    fi

}
```

---

Use:

```bash
check_user kishore

if [ $? -eq 0 ]
then
    echo "User Exists"
else
    echo "User Not Found"
fi
```

---

# Function With File Check

```bash
file_exists() {

    [ -f "$1" ]

}
```

Use:

```bash
if file_exists report.txt
then
    echo "Found"
else
    echo "Missing"
fi
```

---

# Function With Directory Check

```bash
dir_exists() {

    [ -d "$1" ]

}
```

Example:

```bash
dir_exists /tmp

echo $?
```

---

# Logging Function

Very common in Production Scripts.

```bash
log() {

    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1"

}
```

---

Usage:

```bash
log "Starting Backup"

log "Backup Completed"
```

Output:

```text
2026-07-21 10:00:00 : Starting Backup
2026-07-21 10:02:00 : Backup Completed
```

---

# Writing Function Output to Log

```bash
LOG_FILE="/tmp/app.log"

log() {

    echo "$(date) : $1" >> "$LOG_FILE"

}
```

---

# Reusable Backup Function

```bash
backup() {

    cp "$1" "$2"

    if [ $? -eq 0 ]
    then
        echo "Backup Success"
    else
        echo "Backup Failed"
    fi

}
```

---

Call:

```bash
backup file.txt backup/
```

---

# Function Calling Another Function

```bash
start() {

    echo "Start"

}

stop() {

    echo "Stop"

}

restart() {

    stop
    start

}
```

Usage:

```bash
restart
```

---

# Source Command

Load functions from another script.

functions.sh

```bash
hello() {

    echo "Hello"

}
```

main.sh

```bash
source functions.sh

hello
```

or

```bash
. functions.sh
```

---

# Real DevOps Example

Check Disk Usage

```bash
check_disk() {

    usage=$(df -h / | awk 'NR==2 {print $5}')

    echo "$usage"

}
```

Use:

```bash
check_disk
```

---

# Menu Driven Script

```bash
menu() {

echo "1. Start"

echo "2. Stop"

echo "3. Exit"

}
```

---

# Script Structure Best Practice

```bash
#!/bin/bash

log() {

}

validate() {

}

backup() {

}

main() {

    validate

    backup

}
    
main
```

---

# Practical Lab 1

Create:

```bash
hello.sh
```

Function:

```bash
hello() {

echo "Hello Linux"

}
```

Call function.

---

# Practical Lab 2

Create:

```bash
calculator.sh
```

Function:

```bash
add() {

echo $(($1+$2))

}
```

---

# Practical Lab 3

Create:

```bash
usercheck.sh
```

Check if user exists.

Use:

```bash
id username
```

---

# Practical Lab 4

Create:

```bash
backup.sh
```

Create function:

```bash
backup_file()
```

Copy file to backup folder.

---

# Commands and Concepts Learned

```bash
function

return

exit

source

.

local

$?

return 0

return 1

exit 0

exit 1
```

---

# Interview Questions

### What is a Function?

Reusable block of code.

---

### Why Use Functions?

Reduce duplication.

Improve readability.

Improve maintenance.

---

### Difference Between return and exit?

return

```bash
Returns from function.
```

exit

```bash
Terminates entire script.
```

---

### What does $? represent?

Exit status of previous command.

---

### What is source?

Loads another script into current shell.

---

### Can a function return a string?

No.

Use:

```bash
echo
```

and capture output.

---

### What is local variable?

Variable visible only inside function.

---

# Git Commit

```bash
git add Day09/
git commit -m "Day 09 - Functions Return Codes and Error Handling"
```

Or

```bash
git add .
git commit -m "Day 09 Shell scripting functions and modular scripts"
git push origin main
```

---

# Day 09 Outcome

✅ Functions

✅ Function Arguments

✅ Local Variables

✅ Return Codes

✅ Exit Codes

✅ Error Handling

✅ Logging Functions

✅ Script Modularization

✅ Reusable Automation Design

You can now read and understand a large percentage of real Linux Admin and DevOps shell scripts, including backup scripts, cleanup scripts, monitoring scripts, and reporting scripts.
