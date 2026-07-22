# Day 11 - Advanced Shell Scripting: Logging, Error Handling, Redirects, cron & Production Scripting

## Learning Objectives

By the end of Day 11, you should be able to:

- Create production-ready scripts
- Implement logging
- Handle errors properly
- Use stdout and stderr
- Understand file descriptors
- Use redirection operators
- Schedule tasks using cron
- Create script lock files
- Use trap for cleanup
- Build enterprise shell scripts

---

# Why Production Scripting?

Most real-world scripts do more than:

```bash
echo "Hello World"
```

Production scripts need:

- Logging
- Error handling
- Validation
- Cleanup
- Scheduling
- Monitoring

---

# Standard Input Output Streams

Linux uses 3 default streams.

## Standard Input

```text
0 = stdin
```

---

## Standard Output

```text
1 = stdout
```

---

## Standard Error

```text
2 = stderr
```

---

# Standard Output

Example:

```bash
echo "Hello"
```

Output goes to:

```text
stdout
```

---

# Redirect Output

## Overwrite

```bash
echo "Hello" > output.txt
```

Content:

```text
Hello
```

---

## Append

```bash
echo "World" >> output.txt
```

Content:

```text
Hello
World
```

---

# Standard Error

Command:

```bash
ls test.txt
```

If file does not exist:

```text
stderr
```

---

Redirect error:

```bash
ls test.txt 2> error.log
```

---

# Redirect Both Output and Error

```bash
command > logfile 2>&1
```

Example:

```bash
ls file.txt > app.log 2>&1
```

---

# Suppress Output

## /dev/null

Linux black hole.

Ignore output:

```bash
ls > /dev/null
```

---

Ignore errors:

```bash
ls missing.txt 2> /dev/null
```

---

Ignore everything:

```bash
ls missing.txt > /dev/null 2>&1
```

---

# Logging

Every enterprise script should log activities.

## Basic Logging

```bash
echo "$(date) Backup Started" >> backup.log
```

---

# Log Function

```bash
log() {

    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1"

}
```

Usage:

```bash
log "Backup Started"
```

Output:

```text
2026-07-22 10:00:00 : Backup Started
```

---

# Write Logs to File

```bash
LOG_FILE="/tmp/backup.log"

log() {

    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"

}
```

---

# Error Handling

Bad approach:

```bash
cp test.txt backup/
```

---

Better:

```bash
cp test.txt backup/

if [ $? -ne 0 ]
then
    echo "Copy Failed"
fi
```

---

# Preferred Approach

```bash
if cp test.txt backup/
then
    echo "Success"
else
    echo "Failure"
fi
```

---

# set -e

Exit script when command fails.

Example:

```bash
#!/bin/bash

set -e

cp file.txt /backup

echo "Completed"
```

If copy fails:

```text
Script stops immediately
```

---

# set -u

Stop on undefined variables.

Example:

```bash
set -u

echo $username
```

Error:

```text
unbound variable
```

---

# set -x

Debug mode.

```bash
set -x
```

Output:

```text
+ var=test
+ echo test
```

---

# Most Common Production Setting

```bash
set -euo pipefail
```

Meaning:

```text
e = Exit on error
u = Undefined variable check
o pipefail = Pipeline validation
```

---

# pipefail

Without:

```bash
grep test file | sort
```

Pipeline may hide errors.

---

With:

```bash
set -o pipefail
```

Pipeline errors become visible.

---

# Trap Command

Execute action when signal occurs.

---

# Cleanup Before Exit

```bash
trap 'echo "Script Finished"' EXIT
```

---

# Handle CTRL+C

```bash
trap 'echo "Interrupted"; exit' INT
```

---

# Remove Temporary Files

```bash
TEMP_FILE="/tmp/test.tmp"

trap 'rm -f "$TEMP_FILE"' EXIT
```

---

# Temporary Files

Create:

```bash
mktemp
```

Example:

```bash
TEMP=$(mktemp)

echo "$TEMP"
```

Output:

```text
/tmp/tmp.ABCD1234
```

---

# Lock Files

Prevent multiple script executions.

---

Create Lock

```bash
LOCK_FILE="/tmp/backup.lock"

touch "$LOCK_FILE"
```

---

Check Lock

```bash
if [ -f "$LOCK_FILE" ]
then
    echo "Script Already Running"
    exit 1
fi
```

---

Cleanup Lock

```bash
rm -f "$LOCK_FILE"
```

---

# Cron Jobs

Used for scheduling.

---

# View Cron Jobs

```bash
crontab -l
```

---

# Edit Cron Jobs

```bash
crontab -e
```

---

# Cron Format

```text
* * * * * command
│ │ │ │ │
│ │ │ │ └─ Day of Week
│ │ │ └── Month
│ │ └──── Day
│ └────── Hour
└──────── Minute
```

---

# Examples

## Every Minute

```bash
* * * * * /script.sh
```

---

## Every Hour

```bash
0 * * * * /script.sh
```

---

## Daily 2 AM

```bash
0 2 * * * /backup.sh
```

---

## Every Sunday

```bash
0 1 * * 0 /cleanup.sh
```

---

# Cron Logging

```bash
0 2 * * * /backup.sh >> /var/log/backup.log 2>&1
```

---

# Validate Commands

Check command exists:

```bash
command -v docker
```

---

Example:

```bash
if ! command -v docker >/dev/null 2>&1
then
    echo "Docker Not Installed"
fi
```

---

# Check User Permissions

```bash
if [ "$EUID" -ne 0 ]
then
    echo "Run as root"
    exit 1
fi
```

---

# Real-World Backup Script

```bash
#!/bin/bash

set -euo pipefail

LOG_FILE="/tmp/backup.log"

log() {

    echo "$(date) : $1" >> "$LOG_FILE"

}

log "Backup Started"

tar -czf backup.tar.gz /data

log "Backup Completed"
```

---

# Real-World Cleanup Script

```bash
#!/bin/bash

find /backup -type f -mtime +30 -delete
```

---

# Real-World Monitoring Script

```bash
#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}')

echo "Disk Usage = $usage"
```

---

# Real-World User Validation

```bash
#!/bin/bash

read -p "Username: " user

if id "$user" >/dev/null 2>&1
then
    echo "User Exists"
else
    echo "User Not Found"
fi
```

---

# Script Template for Production

```bash
#!/bin/bash

set -euo pipefail

LOG_FILE="/tmp/app.log"

log() {

    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"

}

main() {

    log "Script Started"

    echo "Processing"

    log "Script Finished"

}

main
```

---

# Commands to Master Today

```bash
>

>>

2>

2>>


2>&1

/dev/null

set -e

set -u

set -x

set -o pipefail

trap

mktemp

command -v

crontab -e

crontab -l

EUID
```

---

# Interview Questions

## What is stdout?

```text
File Descriptor 1
```

---

## What is stderr?

```text
File Descriptor 2
```

---

## Difference Between > and >>?

```bash
>
```

Overwrite.

```bash
>>
```

Append.

---

## What is 2>&1?

Redirect stderr to stdout.

---

## Why use /dev/null?

Discard unwanted output.

---

## What is set -e?

Exit script when a command fails.

---

## What is set -u?

Fail on undefined variables.

---

## What is pipefail?

Detect failures inside pipelines.

---

## What is trap?

Handle signals and cleanup tasks.

---

## What is cron?

Linux scheduler for automated jobs.

---

# Lab Exercises

## Lab 1

Create:

```bash
logger.sh
```

Write logs to a file.

---

## Lab 2

Create:

```bash
cleanup.sh
```

Delete files older than 30 days.

---

## Lab 3

Create:

```bash
usercheck.sh
```

Validate user existence.

---

## Lab 4

Create:

```bash
backup.sh
```

Create a compressed backup.

---

## Lab 5

Schedule backup.sh at:

```text
02:00 AM daily
```

Using cron.

---

# Git Commit

```bash
git add Day11/
git commit -m "Day 11 Logging Error Handling and Cron Jobs"
```

Or

```bash
git add .
git commit -m "Day 11 production shell scripting logging cron and trap"
git push origin main
```

---

# Day 11 Outcome

✅ Logging

✅ stdout & stderr

✅ Redirection

✅ /dev/null

✅ Error Handling

✅ set -euo pipefail

✅ trap

✅ Temporary Files

✅ Lock Files

✅ Cron Jobs

✅ Production Script Design

You can now read and understand most production Linux Administration scripts such as backup jobs, cleanup jobs, monitoring scripts, scheduled tasks, and maintenance automation.