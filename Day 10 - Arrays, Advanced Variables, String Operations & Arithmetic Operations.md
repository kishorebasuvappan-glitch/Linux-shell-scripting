# Day 10 - Advanced Shell Scripting

# Learning Objectives

By the end of Day 10, you should understand:

- for loops
- while loops
- until loops
- break
- continue
- Arrays
- Functions Review
- Command Line Options
- shift
- getopts
- Error Handling
- Script Best Practices

---

# For Loop

A for loop executes a block of code multiple times.

## Syntax

```bash
for variable in list
do
    commands
done
```

Example:

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

## Range Loop

```bash
for i in {1..10}
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
6
7
8
9
10
```

---

## File Loop

```bash
for file in *.txt
do
    echo "$file"
done
```
*---

## Directory Loop

```bash
fo* dir in *
do
    echo "$dir"
done
*``

---

# C Style For Loop

Synta*:

```bash
for*((*=1;i<=5;i++))
do
    echo $i
done
*``

Output:

```text
1
2
3
*
5
```

---

# While Loop

Runs*while a condition is true.

## Syn*ax

```bash
while condition
do
   *commands
done
```

Example:

```*ash
count=1

while [ $count -le 5 ]
do
    echo $count
    count*$((count+1))
done
```

Output:

``*text
*
2
3
4
5
```

---

# Reading File *ith While

users.txt

```text
*ohn*alex
david
```

Script:

```bash
w*ile read -r user
*o
    echo "User: $user"
done < us*rs.txt
```

Output:

```text
User:*john
User: alex
*ser* david
```

---

# Until Loop

Run* until condition becomes true.

##*Syntax

```bash
until condition
do*    commands
done
```

Example:

`*`bash
count=1

until [ $count -gt 5 ]
do
    echo $count
    count=$(*count+1))
done
```

Output:

```te*t
1
2
3
4
5
```

---

# Break Stat*ment

Stops loop execution.

Examp*e:

```bash
for i in {1..10}
do
  * if [ $i -eq 5 ]
    then
        *reak
    fi

    echo $i
done
```
*Output:

```text
1
2
3
**```

---

# Continue Statement

Sk*ps current iteration.

Example:

`*`bash
for i in {1..5}
do
    if*[ $i -eq 3 ]
    then
        cont*nue
    fi

    echo $i
done
```

*utput:

```text
1
2
4
5
```

---

* Arrays

Arrays store multiple val*es.

## Create Array

```bash
frui*s=("apple" "banana" "orange")
```
*---

## Print First Element

```ba*h
echo ${fruits[0]}
```

Output:

*``text
apple
```

---

## Print Se*ond Element

```bash
echo ${fruits*1]}
```

Output:

```text
banana
`*`

---

## Print All Elements

```*ash
echo ${fruits[@]}
```

Output:*
```text
apple banana orange
```

*--

## Array Length

```bash
echo *{#fruits[@]}
```

Output:

```text*3
```

---

## Loop Through Array
*```bash
for fruit in "${fruits[@]}*
do
    echo "$fruit"
done
```

--*

# Command Line Arguments

Exampl*:

```bash
./script.sh one two thr*e
```

Access:

```bash
$1
$2
$3
`*`

---

## Count Arguments

```bas*
echo $#
```

Example:

```bash
./*cript.sh a b c
```

Output:

```te*t
3
```

---

# Shift Command

Mov*s arguments left.

Example:

```ba*h
./script.sh one two three
```

I*itially:

```text
$1=one
$2=two
$3*three
```

After:

```bash
shift
`*`

Values become:

```text
$1=two
*2=three
```

---

# Practical Shif* Example

```bash
while [ $# -gt 0*]
do
    echo "$1"
    shift
done
*``

Run:

```bash
./script.sh a b *
```

Output:

```text
a
b
c
```

*--

# getopts

Used for parsing co*mand-line options.

Example:

```b*sh
while getopts "n:a:" opt
do
   *case $opt in

       *n)
*           name=$OPTARG
          * ;;

        a)
            age=$O*TARG
            ;;

    esac
done*```

Run:

```bash
./script.sh -n *ishore -a 30
```

Output:

```text*Name : Kishore
Age  : 30
```

---
*# Error Handling

## Exit on Error*
```bash
set -e
```

Stops script *f a command fails.

Example:

```b*sh
#!/bin/bash

set -e

cp test.tx* backup/

echo "Success"
```

---
*# Undefined Variable Protection

`*`bash
set -u
```

Example:

```bas*
echo $name
```

Output:

```text
*nbound variable
```

---

# Debug *ode

```bash
set -x
```

Example:
*```bash
#!/bin/bash

set -x

name=*ishore

echo $name
```

---

# Com*ining Safety Options

```bash
set *eux
```

Common production usage:
*```bash
set -euo pipefail
```

---*
# Trap Command

Execute command w*en script exits.

Example:

```bas*
trap 'echo "Script Finished"' EXI*
```

---

# Handle CTRL+C

```bas*
trap 'echo "Interrupted"; exit' I*T
```

---

# Functions Review

``*bash
backup() {

    cp "$1" "$2"
*}
```

Call:

```bash
backup file.*xt backup/
```

---

# Real World *xample

Backup All Log Files

```b*sh
#!/bin/bash

for file in *.log
*o
    cp "$file" backup/
done
```
*---

# Real World Example

Check U*ers

```bash
#!/bin/bash

while re*d -r user
do
    id "$user"
done <*users.txt
```

---

# Real World E*ample

System Monitoring

```bash
*!/bin/bash

CPU=$(top -bn1 | grep *pu)

MEM=$(free -h)

echo "$CPU"

*cho "$MEM"
```

---

# Best Practi*es

Always:

```bash
#!/bin/bash
`*`

Use:

```bash
set -euo pipefail*```

Quote variables:

```bash
"$f*le"
```

Use functions.

Check exi* codes.

Log important actions.

-*-

# Commands Learned

```bash
for*while
until
break
continue

shift
*etopts

set -e
set -u
set -x

trap*
arrays

${array[@]}
${#array[@]}
*``

---

# Interview Questions

##*Difference Between For and While?
*For:

```bash
Known iterations
```

While:

```bash
Condition-based iterations
```

---

## What Does Shift Do?

Moves positional arguments left.

---

## What Is getopts Used For?

Parse command-line options.

---

## What Is set -e?

Stop script when command fails.

---

## What Is set -u?

Catch undefined variables.

---

## What Is set -x?

Debug script execution.

---

## What Does Trap Do?

Execute command when signal occurs.

---

# Practical Lab

## Lab 1

Print numbers 1-20 using for loop.

---

## Lab 2

Read users.txt using while loop.

---

## Lab 3

Create array of servers.

Loop through servers.

---

## Lab 4

Create script using getopts.

Accept:

```bash
-n
-a
```

parameters.

---

## Lab 5

Create backup script.

Copy all log files to backup directory.

---

# Git Commit

```bash
git add Day10/
git commit -m "Day 10 Advanced Shell Scripting Loops Arrays and getopts"
```

Or

```bash
git add .
git commit -m "Day 10 loops arrays shift getopts trap and error handling"
git push origin main
```

---

# Day 10 Outcome

✅ for loop

✅ while loop

✅ until loop

✅ break

✅ continue

✅ Arrays

✅ shift

✅ getopts

✅ set -e

✅ set -u

✅ set -x

✅ trap

✅ Production Script Best Practices

You can now understand and write most real-world Linux Administration and DevOps shell scripts.
