# Day 06 - Introduction to Shell Scripting (Bash)

## Learning Objectives

By the end of Day 06, you should be able to:

- Understand Shell Scripting
- Create Bash Scripts
- Execute Scripts
- Use Variables
- Accept User Input
- Use Command Line Arguments
- Understand Exit Status
- Work with Quotes
- Use Basic Operators
- Create Real-World Scripts

---

# What is Shell Scripting?

A shell script is a file containing Linux commands executed sequentially.

Instead of running:

```bash
date
pwd
whoami
```

one by one,

You can put them in a script:

```bash
#!/bin/bash

date
pwd
whoami
```

and execute everything together.

---

# Advantages of Shell Scripting

- Automation
- Server Administration
- Monitoring
- Backups
- Log Cleanup
- DevOps Tasks
- Deployment Automation

---

# First Shell Script

Create file:

```bash
vim hello.sh
```

OR

```bash
nano hello.sh
```

---

Content:

```bash
#!/bin/bash

echo "Hello World"
```

---

Save file

Give execute permission:

```bash
chmod +x hello.sh
```

Run:

```bash
./hello.sh
```

Output:

```text
Hello World
```

---

# Understanding Shebang

```bash
#!/bin/bash
```

Called:

```text
Shebang
```

Tells Linux which interpreter should execute the script.

Examples:

```bash
#!/bin/bash
#!/bin/sh
#!/usr/bin/env bash
```

---

# Executing Scripts

Method 1

```bash
./hello.sh
```

---

Method 2

```bash
bash hello.sh
```

---

Method 3

```bash
sh hello.sh
```

---

# Comments

Single line comment

```bash
# This is comment
```

Example:

```bash
#!/bin/bash

# Print date

date
```

---

# Variables

Variables store data.

Syntax:

```bash
variable=value
```

Example:

```bash
name=Kishore
```

Use variable:

```bash
echo $name
```

Output:

```text
Kishore
```

---

# Variable Example

```bash
#!/bin/bash

name=Kishore

echo $name
```

Output:

```text
Kishore
```

---

# Best Practice

Always use braces:

```bash
echo ${name}
```

---

# Multiple Variables

```bash
#!/bin/bash

name=Kishore
role=DevOps
city=Chennai

echo $name
echo $role
echo $city
```

---

# Read-Only Variable

```bash
readonly company="Microsoft"
```

---

Attempting update:

```bash
company=Google
```

Error:

```text
readonly variable
```

---

# Unset Variable

```bash
name=Kishore
unset name
```

Verify:

```bash
echo $name
```

Output:

```text

```

---

# Built-in Variables

---

Current Script Name

```bash
echo $0
```

---

First Argument

```bash
echo $1
```

---

Second Argument

```bash
echo $2
```

---

All Arguments

```bash
echo $@
```

---

Number of Arguments

```bash
echo $#
```

---

Process ID

```bash
echo $$
```

---

Exit Status

```bash
echo $?
```

---

Current User

```bash
echo $USER
```

---

Home Directory

```bash
echo $HOME
```

---

Current Shell

```bash
echo $SHELL
```

---

# Command Substitution

Store command output.

Old style:

```bash
today=`date`
```

---

Recommended:

```bash
today=$(date)
```

---

Example

```bash
#!/bin/bash

today=$(date)

echo $today
```

---

Current Directory

```bash
current_dir=$(pwd)

echo $current_dir
```

---

# User Input

## read

Accept user input.

```bash
read name
```

---

Example

```bash
#!/bin/bash

echo "Enter Name"

read name

echo "Welcome $name"
```

---

Output

```text
Enter Name
Kishore
Welcome Kishore
```

---

# Input with Prompt

```bash
read -p "Enter Name: " name
```

---

Example

```bash
#!/bin/bash

read -p "Enter Username: " user

echo "User: $user"
```

---

# Hidden Password Input

```bash
read -s password
```

Example:

```bash
read -sp "Enter Password: " password
```

---

# Command Line Arguments

Script:

```bash
#!/bin/bash

echo $1
echo $2
```

---

Run:

```bash
./test.sh Kishore DevOps
```

Output:

```text
Kishore
DevOps
```

---

# Practical Example

```bash
#!/bin/bash

echo "Name: $1"
echo "Role: $2"
echo "Location: $3"
```

Run:

```bash
./employee.sh Kishore DevOps Chennai
```

Output:

```text
Name: Kishore
Role: DevOps
Location: Chennai
```

---

# Quotes

## Double Quotes

Variable expansion works.

```bash
name=Kishore

echo "$name"
```

Output:

```text
Kishore
```

---

## Single Quotes

Variable expansion disabled.

```bash
echo '$name'
```

Output:

```text
$name
```

---

# Arithmetic Operations

Method 1

```bash
echo $((5+5))
```

Output:

```text
10
```

---

Addition

```bash
a=10
b=20

echo $((a+b))
```

---

Subtraction

```bash
echo $((b-a))
```

---

Multiplication

```bash
echo $((a*b))
```

---

Division

```bash
echo $((b/a))
```

---

Modulus

```bash
echo $((10%3))
```

---

# Exit Status

Every Linux command returns exit status.

Success

```text
0
```

Failure

```text
non-zero
```

---

Example

```bash
ls
echo $?
```

Output:

```text
0
```

---

Invalid Command

```bash
abcd
echo $?
```

Output:

```text
127
```

---

# Important Environment Variables

Display all variables:

```bash
env
```

---

Current User

```bash
echo $USER
```

---

Home Directory

```bash
echo $HOME
```

---

Path Variable

```bash
echo $PATH
```

---

Shell

```bash
echo $SHELL
```

---

Hostname

```bash
echo $HOSTNAME
```

---

# Export Variables

Create variable:

```bash
name=Kishore
```

---

Current shell only.

Export:

```bash
export name
```

---

Available to child processes.

Verify:

```bash
env | grep name
```

---

# Debugging Scripts

Run with debug mode:

```bash
bash -x script.sh
```

Example:

```bash
bash -x hello.sh
```

---

# Sample Script 1

System Information Script

```bash
#!/bin/bash

echo "User: $USER"

echo "Hostname: $HOSTNAME"

echo "Current Directory: $(pwd)"

echo "Today: $(date)"
```

Run:

```bash
./systeminfo.sh
```

---

# Sample Script 2

Addition Script

```bash
#!/bin/bash

read -p "Enter First Number: " a

read -p "Enter Second Number: " b

sum=$((a+b))

echo "Sum = $sum"
```

---

# Sample Script 3

User Information

```bash
#!/bin/bash

echo "Username: $1"
echo "Department: $2"
echo "Location: $3"
```

Run:

```bash
./userinfo.sh Kishore DevOps Chennai
```

---

# Lab Exercises

## Lab 1

Create script:

```bash
hello.sh
```

Print:

```text
Hello DevOps
```

---

## Lab 2

Create script:

```bash
userinfo.sh
```

Accept username.

Display:

```text
Welcome username
```

---

## Lab 3

Create script:

```bash
systeminfo.sh
```

Display:

```bash
date
hostname
pwd
whoami
```

---

## Lab 4

Create script:

```bash
calculator.sh
```

Add two numbers.

---

# Commands to Master Today

```bash
bash
sh
chmod +x

read

echo

env

export

unset

readonly

$0
$1
$2
$#
$@
$?
$$

$(command)

bash -x
```

---

# Interview Questions

### What is Shell Scripting?

Automation using shell commands in a script file.

---

### What is Bash?

Bourne Again Shell.

---

### What is Shebang?

```bash
#!/bin/bash
```

Defines the interpreter.

---

### Difference between $* and $@ ?

Used to access all arguments.

---

### What does $? represent?

Exit status of previous command.

---

### What does $$ represent?

Current process ID.

---

### How do you pass values to scripts?

```bash
./script.sh value1 value2
```

---

### Difference between Single and Double Quotes?

Single quote:

```bash
'$USER'
```

No expansion.

Double quote:

```bash
"$USER"
```

Expansion occurs.

---

# Git Commit

```bash
git add Day06/
git commit -m "Day 06 - Introduction to Shell Scripting"
```

Or:

```bash
git add .
git commit -m "Day 06 Bash variables input output and arguments"
git push origin main
```

---

# Day 06 Outcome

✅ First Shell Script

✅ Shebang

✅ Variables

✅ Environment Variables

✅ User Input

✅ Command Line Arguments

✅ Arithmetic Operations

✅ Exit Status

✅ Command Substitution

✅ Script Debugging

You are now ready for Day 07 where you will learn:

- if
- else
- elif
- nested if
- case statement
- logical operators
- comparison operators

These are the building blocks of real-world automation scripts.
