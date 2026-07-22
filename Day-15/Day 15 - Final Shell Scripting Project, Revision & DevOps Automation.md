# Day 15 - Final Shell Scripting Project, Revision & DevOps Automation

## Learning Objectives

By the end of Day 15, you should be able to:

- Build complete shell scripting projects
- Design production-ready automation
- Combine Linux and Shell Scripting knowledge
- Implement monitoring solutions
- Create backup frameworks
- Generate reports
- Parse logs
- Schedule jobs using cron
- Troubleshoot Linux servers
- Think like a Linux Administrator or DevOps Engineer

---

# Shell Scripting Journey Summary

You have learned:

```text
Day 01 - Linux Basics
Day 02 - File Management
Day 03 - User Management
Day 04 - grep, sed, awk
Day 05 - Process Management
Day 06 - Shell Scripting Basics
Day 07 - Conditions
Day 08 - Loops
Day 09 - Functions
Day 10 - Arrays & Strings
Day 11 - Logging, Cron & Error Handling
Day 12 - CSV & Log Processing
Day 13 - Monitoring & Troubleshooting
Day 14 - Enterprise Automation Projects
```

Now we combine everything into real projects.

---

# Production Script Design Flow

Every enterprise script typically follows:

```text
1. Validate Input
2. Create Logs
3. Execute Task
4. Handle Errors
5. Generate Report
6. Cleanup
7. Exit
```

---

# Project 1 - Linux Health Check Script

## Requirements

Display:

```text
Hostname
Date
Kernel
Uptime
CPU
Memory
Disk Usage
Load Average
```

---

## Script

```bash
#!/bin/bash

echo "=================================="
echo "Linux Health Check"
echo "=================================="

echo "Hostname: $(hostname)"

echo "Date: $(date)"

echo "Kernel: $(uname -r)"

echo

echo "Uptime:"
uptime

echo

echo "Memory:"
free -h

echo

echo "Disk:"
df -h

echo

echo "CPU:"
lscpu | grep "Model name"
```

---

# Project 2 - Disk Usage Monitoring Tool

## Requirements

```text
Check all mounted filesystems

Alert above 80%
```

---

## Script

```bash
#!/bin/bash

df -h | awk '

NR>1 {

usage=$5

gsub("%","",usage)

if (usage > 80)

print $6 " -> ALERT : " usage "%"

}'
```

---

# Project 3 - User Audit Report

Display:

```text
Total Users
Bash Users
Current Logged-In Users
```

---

## Script

```bash
#!/bin/bash

echo "Total Users:"

wc -l < /etc/passwd

echo

echo "Bash Users:"

grep "/bin/bash" /etc/passwd | wc -l

echo

echo "Logged In Users:"

who
```

---

# Project 4 - Service Health Monitoring

Monitor:

```text
ssh
cron
docker
```

---

## Script

```bash
#!/bin/bash

services=("ssh" "cron" "docker")

for svc in "${services[@]}"
do

status=$(systemctl is-active "$svc")

echo "$svc : $status"

done
```

---

# Project 5 - Backup Automation

## Requirement

Create:

```text
Compressed Backup

Timestamped File

Log File
```

---

## Script

```bash
#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%S)

LOG_FILE="/tmp/backup.log"

BACKUP_FILE="home_${DATE}.tar.gz"

echo "$(date) Backup Started" >> "$LOG_FILE"

tar -czf "$BACKUP_FILE" /home

echo "$(date) Backup Finished" >> "$LOG_FILE"
```

---

# Project 6 - Old Backup Cleanup

Delete:

```text
Files Older Than 30 Days
```

---

## Script

```bash
#!/bin/bash

find /backup \
-type f \
-mtime +30 \
-delete
```

---

# Project 7 - Patch Report Generator

Ubuntu:

```bash
apt list --upgradable 2>/dev/null
```

Create Report:

```bash
apt list --upgradable 2>/dev/null \
| awk -F/ 'NR>1 {print $1}'
```

---

# Project 8 - Log Analyzer

Sample:

```text
INFO Started

ERROR Failed

WARNING High Usage

ERROR Connection Failed
```

---

## Count Messages

```bash
echo "INFO    : $(grep -c INFO app.log)"

echo "WARNING : $(grep -c WARNING app.log)"

echo "ERROR   : $(grep -c ERROR app.log)"
```

---

# Project 9 - Failed Login Detection

Search Authentication Logs:

Ubuntu:

```bash
grep "Failed password" /var/log/auth.log
```

Count:

```bash
grep -c "Failed password" /var/log/auth.log
```

---

# Project 10 - System Inventory Report

Generate:

```text
Hostname
OS Version
Kernel
CPU
Memory
Disk
Network
```

---

## Script

```bash
#!/bin/bash

echo "Hostname: $(hostname)"

echo

echo "Kernel: $(uname -r)"

echo

echo "CPU"

lscpu

echo

echo "Memory"

free -h

echo

echo "Disk"

df -h

echo

echo "IP"

hostname -I
```

---

# Combining Everything

## Enterprise Script Template

```bash
#!/bin/bash

set -euo pipefail

LOG_FILE="/tmp/app.log"

log() {

echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOG_FILE"

}

validate() {

command -v awk >/dev/null 2>&1

command -v grep >/dev/null 2>&1

}

cleanup() {

:

}

main() {

log "Started"

validate

echo "Processing Data"

log "Completed"

}

trap cleanup EXIT

main "$@"
```

---

# Linux Troubleshooting Workflow

When a server is slow:

---

## Step 1

Check uptime

```bash
uptime
```

---

## Step 2

Check CPU

```bash
top
```

---

## Step 3

Check memory

```bash
free -h
```

---

## Step 4

Check disk

```bash
df -h
```

---

## Step 5

Check services

```bash
systemctl --failed
```

---

## Step 6

Check logs

```bash
journalctl -xe
```

---

## Step 7

Check processes

```bash
ps -ef
```

---

# Shell Scripting Best Practices

Always:

```bash
Use Functions

Use Quoted Variables

Use Logging

Validate Input

Use set -euo pipefail
```

---

Never:

```bash
Use Unquoted Variables

Ignore Exit Codes

Use Hardcoded Values Everywhere

Run rm -rf Without Validation
```

---

# Mini Capstone Project

## Server Audit Tool

Requirements:

Display:

```text
Hostname

Date

Uptime

Disk Usage

Memory Usage

Top 5 Processes

Failed Services

Current Users
```

Commands:

```bash
hostname

date

uptime

df -h

free -h

ps aux

systemctl --failed

who
```

---

# DevOps Shell Scripting Command Revision

```bash
grep

sed

awk

cut

sort

uniq

tr

find

xargs

tar

gzip

zip

ssh

scp

rsync

cron

systemctl

journalctl

ps

top

free

df

du

curl

wget

ping
```

---

# Interview Questions

## Difference between grep, sed and awk?

grep:

```text
Search text
```

sed:

```text
Edit text
```

awk:

```text
Process columns and generate reports
```

---

## Why use set -euo pipefail?

Provides safer shell scripting.

---

## How do you monitor disk usage?

```bash
df -h
```

---

## How do you monitor memory?

```bash
free -h
```

---

## How do you view logs?

```bash
journalctl
```

or

```bash
tail -f logfile
```

---

## How do you schedule scripts?

```bash
crontab -e
```

---

## How do you write reusable code?

Using:

```bash
Functions
```

---

# Final Practical Labs

## Lab 1

Create:

```bash
healthcheck.sh
```

Display:

```text
CPU

Memory

Disk

Load Average
```

---

## Lab 2

Create:

```bash
backup_manager.sh
```

Features:

```text
Backup

Logging

Cleanup
```

---

## Lab 3

Create:

```bash
log_analyzer.sh
```

Display:

```text
INFO Count

WARNING Count

ERROR Count
```

---

## Lab 4

Create:

```bash
user_audit.sh
```

Display:

```text
Total Users

Bash Users

Logged-In Users
```

---

## Lab 5

Create:

```bash
inventory_report.sh
```

Generate:

```text
Complete Server Inventory
```

---

# Commands to Master Before Moving to DevOps Tools

```bash
grep
sed
awk

find
xargs

tar
gzip

cron

ps
top

free
df

ssh
scp

curl
wget

systemctl

journalctl

bash
```

---

# Git Commit

```bash
git add Day15/
git commit -m "Day 15 Final Shell Scripting Projects and Revision"
```

Or

```bash
git add .
git commit -m "Day 15 complete shell scripting automation projects"
git push origin main
```

---

# Day 15 Outcome

✅ Complete Shell Scripting Foundation

✅ Linux Administration Automation

✅ Monitoring Scripts

✅ Backup Scripts

✅ Log Analysis Scripts

✅ CSV Processing

✅ Reporting Scripts

✅ Troubleshooting Skills

✅ Enterprise Script Design

✅ Real-World DevOps Automation

Congratulations! 🎉

After Days 1–15, you now have a strong Linux and Shell Scripting foundation. You are ready to move on to:

```text
Day 16 - Git & GitHub
Day 17 - Advanced Git
Day 18 - Networking for DevOps
Day 19 - SSH & Security
Day 20 - Storage & Filesystems
Day 21+ Docker
Day 25+ Kubernetes
Day 35+ Terraform
Day 45+ CI/CD
```

You are now at the stage where you can read, understand, troubleshoot, and build most Linux Administration and beginner-to-intermediate DevOps shell scripts used in production environments.