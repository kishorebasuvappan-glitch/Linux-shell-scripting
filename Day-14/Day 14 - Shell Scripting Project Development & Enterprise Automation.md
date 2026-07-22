# Day 14 - Shell Scripting Project Development & Enterprise Automation

## Learning Objectives

By the end of Day 14, you should be able to:

- Design complete shell scripting projects
- Follow enterprise scripting standards
- Build reusable automation frameworks
- Implement input validation
- Generate reports
- Automate server administration tasks
- Create monitoring solutions
- Create backup solutions
- Build production-ready scripts
- Understand real DevOps scripting patterns

---

# Enterprise Script Structure

Most production scripts follow this layout:

```bash
#!/bin/bash

set -euo pipefail

LOG_FILE="/var/log/script.log"

log() {

}

validate() {

}

main() {

}

main "$@"
```

Benefits:

- Readable
- Reusable
- Easy maintenance
- Easy troubleshooting

---

# Standard Production Header

```bash
#!/bin/bash

set -euo pipefail
```

Explanation:

```text
e = Exit on error

u = Fail on undefined variables

o pipefail = Detect pipeline failures
```

---

# Input Validation

Never trust user input.

Example:

```bash
read -p "Enter Age: " age

if ! [[ "$age" =~ ^[0-9]+$ ]]
then
    echo "Only numbers allowed"
    exit 1
fi
```

---

# Check Required Arguments

```bash
if [ $# -ne 2 ]
then
    echo "Usage: $0 source destination"
    exit 1
fi
```

---

# Logging Function

```bash
LOG_FILE="/tmp/app.log"

log() {

    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"

}
```

Usage:

```bash
log "Backup Started"
```

---

# Error Function

```bash
error() {

    echo "ERROR: $1"

    exit 1

}
```

Usage:

```bash
[ -f input.txt ] || error "File not found"
```

---

# Success Function

```bash
success() {

    echo "SUCCESS: $1"

}
```

---

# Command Validation

Check if command exists:

```bash
command -v docker
```

Example:

```bash
if ! command -v docker >/dev/null 2>&1
then
    echo "Docker not installed"
    exit 1
fi
```

---

# Lock File Mechanism

Prevent multiple executions.

```bash
LOCK_FILE="/tmp/backup.lock"
```

Check:

```bash
if [ -f "$LOCK_FILE" ]
then
    echo "Script already running"
    exit 1
fi
```

Create:

```bash
touch "$LOCK_FILE"
```

Cleanup:

```bash
rm -f "$LOCK_FILE"
```

---

# Trap Cleanup

```bash
trap 'rm -f "$LOCK_FILE"' EXIT
```

Even if script crashes:

```text
Lock file removed
```

---

# Temporary Files

Create:

```bash
TEMP_FILE=$(mktemp)
```

Example:

```bash
echo "Testing" > "$TEMP_FILE"
```

Cleanup:

```bash
rm -f "$TEMP_FILE"
```

---

# Project 1 - Disk Usage Monitor

## Requirement

Alert if disk usage exceeds 80%.

---

## Script

```bash
#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt 80 ]
then
    echo "Disk usage alert: $usage%"
else
    echo "Disk usage normal"
fi
```

---

# Project 2 - User Audit Report

Display:

```text
Total Users

Bash Users

Locked Users
```

---

## Total Users

```bash
wc -l /etc/passwd
```

---

## Bash Users

```bash
grep "/bin/bash" /etc/passwd
```

---

## Usernames

```bash
cut -d: -f1 /etc/passwd
```

---

# Project 3 - Service Health Check

Check important services.

```bash
services=("ssh" "cron")

for svc in "${services[@]}"
do

    status=$(systemctl is-active "$svc")

    echo "$svc : $status"

done
```

---

# Project 4 - Backup Automation

Backup home directory.

```bash
#!/bin/bash

DATE=$(date +%Y%m%d)

tar -czf home_$DATE.tar.gz /home
```

---

# Project 5 - Old File Cleanup

Delete files older than 30 days.

```bash
find /backup -type f -mtime +30 -delete
```

---

# Project 6 - Log Analyzer

Count:

```text
INFO

WARNING

ERROR
```

Script:

```bash
echo "INFO: $(grep -c INFO app.log)"

echo "WARNING: $(grep -c WARNING app.log)"

echo "ERROR: $(grep -c ERROR app.log)"
```

---

# Project 7 - Inventory Report

Display:

```text
Hostname

Kernel

Memory

Disk

CPU
```

Script:

```bash
hostname

uname -r

free -h

df -h

lscpu
```

---

# CSV Report Generation

employees.csv

```text
101,Kishore,DevOps,90000
102,John,AWS,85000
103,Alex,Azure,95000
```

---

Display report:

```bash
awk -F',' '

BEGIN {
    print "Name Salary"
}

{
    print $2,$4
}

' employees.csv
```

---

# Generate HTML Report

Example:

```bash
echo "<html>" > report.html

echo "<body>" >> report.html

echo "<h1>Server Report</h1>" >> report.html

echo "</body>" >> report.html

echo "</html>" >> report.html
```

---

# Generate CSV Report

```bash
echo "Name,Salary" > report.csv

awk -F',' '{print $2","$4}' employees.csv >> report.csv
```

---

# Generate Timestamped Files

```bash
DATE=$(date +%Y%m%d_%H%M%S)

LOGFILE="report_$DATE.log"
```

Example:

```text
report_20260722_101500.log
```

---

# Processing Multiple Servers

servers.txt

```text
web01
web02
db01
```

---

Script:

```bash
while read -r server
do

    echo "Checking $server"

done < servers.txt
```

---

# Menu Driven Script

```bash
while true
do

echo "1. Disk"

echo "2. Memory"

echo "3. Exit"

read choice

case $choice in

1)

    df -h

    ;;

2)

    free -h

    ;;

3)

    exit 0

    ;;

*)

    echo "Invalid"

    *;

esac

done
```

---

# Professi*nal Script Template

```bash
#!/bi*/bash

set -euo pipefail

LOG_FILE*"/tmp/app.log"

log() {

    echo *$(date '+%Y-%m-%d %H:%M:%S') : $1"*>> "$LOG_FILE"

}

validate() {

 *  command -v awk >/dev/null 2>&1
}*
cleanup() {

    rm -f "$TEMP_FIL*"

}

main() {

    log "Started"
*    validate

    log "Completed"
*}

trap cleanup EXIT

main "$@"
``*

---

# Enterprise Best Practices*
Always:

```bash
Use functions

V*lidate inputs

Use logging

Use er*or handling

Quote variables

Use *et -euo pipefail

Clean temporary *iles

Use lock files
```

---

# M*ni Project 1

Disk Monitoring Tool*
Requirements:

```text
Check Disk*Usage

Log Output

Alert Above 80%*```

---

# Mini Project 2

Backup*Manager

Requirements:

```text
Cr*ate Backup

Create Log

Delete Old*Backups
```

---

# Mini Project 3*
Server Health Check

Requirements*

```text
CPU

Memory

Disk

Load *verage

Services
```

---

# Mini *roject 4

Patch Report Generator

*equirements:

```text
List Availab*e Updates

Generate CSV

Timestamp*Output
```

---

# Commands to Mas*er Today

```bash
mktemp

trap

co*mand -v

tar

awk

grep

cut

find*
systemctl

hostname

uname

date
*df

free

lscpu

wc

set -euo pipe*ail
```

---

# Interview Question*

## Why use set -euo pipefail?

S*fer scripting.

Stops hidden failu*es.

---

## What is a lock file?
*Prevents multiple instances of the*same script.

---

## What is trap*

Executes cleanup tasks when scri*t exits.

---

## How do you valid*te a command exists?

```bash
comm*nd -v docker
```

---

## How do y*u create timestamped filenames?

`*`bash
DATE=$(date +%Y%m%d_%H%M%S)
*``

---

## How do you delete file* older than 30 days?

```bash
find*. -mtime +30 -delete
```

---

## *ow do you generate reports from CS* files?

```bash
awk -F','
```

--*

# Lab Exercises

## Lab 1

Creat*:

```bash
disk_monitor.sh
```

Re*uirements:

```text
Check disk usa*e

Alert above 80%
```

---

## La* 2

Create:

```bash
backup_manage*.sh
```

Requirements:

```text
Ba*kup folder

Generate log

Cleanup *fter 30 days
```

---

## Lab 3

C*eate:

```bash
inventory_report.sh*```

Display:

```text
Hostname

K*rnel

Memory

Disk

CPU
```

---

*# Lab 4

Create:

```bash
service_*ealth.sh
```

Check:

```text
ssh
*cron

docker
```

---

# Git Commi*

```bash
git add Day14/
git commi* -m "Day 14 Enterprise Shell Scrip*ing Projects"
```

Or

```bash
git*add .
git commit -m "Day 14 produc*ion automation monitoring backup and reporting projects"
git push origin main
```

---

# Day 14 Outcome

✅ Enterprise Script Structure

✅ Input Validation

✅ Logging Framework

✅ Error Handling

✅ Lock Files

✅ Trap Cleanup

✅ Monitoring Automation

✅ Backup Automation

✅ Report Generation

✅ Production Shell Scripting Projects

You can now design and build complete Linux Administration and DevOps automation solutions similar to those used in real production environments.