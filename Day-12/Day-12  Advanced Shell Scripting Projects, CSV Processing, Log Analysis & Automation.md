# Day 12 - Advanced Shell Scripting Projects, CSV Processing, Log Analysis & Automation

## Learning Objectives

By the end of Day 12, you should be able to:

- Process CSV files
- Generate reports
- Parse logs
- Build monitoring scripts
- Create audit scripts
- Automate routine Linux tasks
- Use awk, sed, grep together
- Create reusable automation scripts
- Develop real-world DevOps projects

---

# Why Day 12?

Up to Day 11, you've learned:

- Variables
- Conditions
- Loops
- Functions
- Arrays
- Error Handling
- Logging
- Cron

Now it's time to combine them and solve real-world problems.

---

# CSV File Processing

Sample CSV File

employees.csv

```text
ID,Name,Department,Salary
101,Kishore,DevOps,90000
102,John,AWS,85000
103,Alex,Azure,95000
104,David,DevOps,100000
```

---

# Print Specific Column

Display employee names:

```bash
awk -F',' '{print $2}' employees.csv
```

Output:

```text
Name
Kishore
John
Alex
David
```

---

# Skip Header

```bash
awk -F',' 'NR>1 {print $2}' employees.csv
```

Output:

```text
Kishore
John
Alex
David
```

---

# Print Multiple Columns

```bash
awk -F',' 'NR>1 {print $2,$3}' employees.csv
```

Output:

```text
Kishore DevOps
John AWS
Alex Azure
David DevOps
```

---

# Calculate Total Salary

```bash
awk -F',' 'NR>1 {sum+=$4} END {print sum}' employees.csv
```

Output:

```text
370000
```

---

# Calculate Average Salary

```bash
awk -F',' 'NR>1 {sum+=$4;count++} END {print sum/count}' employees.csv
```

Output:

```text
92500
```

---

# Generate CSV Report

```bash
awk -F',' '
BEGIN {print "Name,Salary"}
NR>1 {print $2","$4}
' employees.csv
```

---

# Log Analysis

Create sample log:

app.log

```text
INFO Application Started
ERROR Database Connection Failed
INFO Request Received
WARNING Disk Usage High
ERROR Login Failed
```

---

# Display Errors

```bash
grep ERROR app.log
```

Output:

```text
ERROR Database Connection Failed
ERROR Login Failed
```

---

# Count Errors

```bash
grep -c ERROR app.log
```

Output:

```text
2
```

---

# Count Warnings

```bash
grep -c WARNING app.log
```

Output:

```text
1
```

---

# Display Only INFO Lines

```bash
grep INFO app.log
```

---

# Analyze Log Summary

```bash
echo "Errors : $(grep -c ERROR app.log)"
echo "Warnings : $(grep -c WARNING app.log)"
echo "Info : $(grep -c INFO app.log)"
```

---

# Search Logs for Multiple Patterns

```bash
grep -E "ERROR|WARNING" app.log
```

---

# Monitor Logs in Real Time

```bash
tail -f app.log
```

---

# Server Monitoring Script

Example:

```bash
#!/bin/bash

echo "Hostname : $(hostname)"

echo "Date : $(date)"

echo "Disk Usage :"

df -h

echo

echo "Memory Usage :"

free -h
```

---

# Disk Usage Monitoring

Get root partition usage:

```bash
df -h / | awk 'NR==2 {print $5}'
```

Example:

```text
67%
```

---

# Alert When Usage Exceeds Limit

```bash
usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt 80 ]
then
    echo "Disk Alert"
fi
```

---

# User Audit Script

Display all users:

```bash
cut -d: -f1 /etc/passwd
```

---

Count Users

```bash
wc -l /etc/passwd
```

---

Show Users with Bash Shell

```bash
grep "/bin/bash" /etc/passwd
```

---

# Service Monitoring

Check service status:

```bash
systemctl is-active ssh
```

---

Check Multiple Services

```bash
for svc in ssh cron docker
do
    systemctl is-active "$svc"
done
```

---

# Backup Automation Script

```bash
#!/bin/bash

BACKUP_DIR="/backup"

DATE=$(date +%Y%m%d)

tar -czf "$BACKUP_DIR/home_$DATE.tar.gz" /home
```

---

# Automatic Old Backup Cleanup

Delete backups older than 30 days:

```bash
find /backup -type f -mtime +30 -delete
```

---

# Processing Files Line by Line

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

# Health Check Script

```bash
#!/bin/bash

ping -c 1 google.com >/dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "Network OK"
else
    echo "Network Issue"
fi
```

---

# Generate Inventory Report

```bash
#!/bin/bash

echo "Hostname: $(hostname)"

echo "Kernel: $(uname -r)"

echo "Memory:"

free -h

echo "Disk:"

df -h
```

---

# Parse Command Output

Example:

```bash
ps -ef | awk '{print $1,$2,$8}'
```

Output:

```text
USER PID COMMAND
root 1 systemd
root 500 sshd
```

---

# Count Running Processes

```bash
ps -ef | wc -l
```

---

# Monitor Top Memory Processes

```bash
ps aux --sort=-%mem | head
```

---

# Parse Package Updates

Example:

```bash
apt list --upgradable 2>/dev/null
```

Extract package names:

```bash
apt list --upgradable 2>/dev/null | awk -F/ 'NR>1 {print $1}'
```

---

# Menu Driven Automation

```bash
while true
do

echo "1. Disk Usage"
echo "2. Memory Usage"
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
    echo "*nvalid Option"
    ;;

esac*
*one
```

---

# Combining grep, aw* and sed

Sample File

```text
101*Kishore,DevOps
102,John,AWS
```

D*splay names:

```bash
awk -F',' '{*rint $2}'
```

---

Replace DevOps*

```bash
sed 's/DevOps/SRE/'
```
*---

Filter John:

```bash
grep Jo*n
```

---

Combined:

```bash
cat*employees.csv | awk -F',' '{print *2}' | grep John
```

---

# Produc*ion Script Template

```bash
#!/bi*/bash

set -euo pipefail

LOG_FILE*"/tmp/report.log"

log() {

    ec*o "$(date '+%Y-%m-%d %H:%M:%S') : *1" >> "$LOG_FILE"

}

main() {

  * log "Started"

    echo "Processi*g"

    log "Completed"

}

main
`*`

---

# Mini Project 1

Employee*Report Generator

Requirements:

`*`text
Read employees.csv

Display:*- Total Employees
- Total Salary
-*Average Salary
```

---

# Mini Pr*ject 2

Disk Monitoring Script

Re*uirements:

```text
Check Disk Usa*e

Alert if usage > 80%
```

---

* Mini Project 3

Backup Cleaner

R*quirements:

```text
Delete files *lder than 30 days

Generate log re*ort
```

---

# Mini Project 4

Us*r Audit Script

Requirements:

```*ext
List Users

Count Users

Displ*y Bash Users
```

---

# Commands *o Master Today

```bash
grep

grep*-c

grep -E

awk

awk -F

sed

cut*
tr

wc

tail -f

find -mtime

sys*emctl is-active

ps

df

free

tar*
ping
```

---

# Interview Questi*ns

## How do you calculate the su* of a CSV column?

```bash
awk -F'*' '{sum+=$4} END {print sum}'
```
*---

## How do you skip CSV header*?

```bash
NR>1
```

---

## How d* you count ERROR entries?

```bash*grep -c ERROR logfile
```

---

##*How do you check disk usage?

```b*sh
df -h
```

---

## How do you d*lete files older than 30 days?

``*bash
find . -mtime +30 -delete
```*
---

## How do you monitor logs?
*```bash
tail -f logfile
```

---

*# How do you count running process*s?

```bash
ps -ef | wc -l
```

--*

# Lab Exercises

## Lab 1

Creat*:

```bash
salary_report.sh
```

R*ad CSV and calculate:

```text
Tot*l Salary
Average Salary
```

---

*# Lab 2

Create:

```bash
diskchec*.sh
```

Alert when disk usage exc*eds:

```text
80%
```

---

## Lab*3

Create:

```bash
logreport.sh
`*`

Display:

```text
INFO count
ER*OR count
WARNING count
```

---

#* Lab 4

Create:

```bash
inventory*sh
```

Display:

```text
Hostname*Memory
Disk
Kernel
```

---

# Git*Commit

```bash
git add Day12/
git*commit -m "Day 12 Log Analysis CSV*Processing and Automation Projects"
```

Or

```bash
git add .
git commit -m "Day 12 shell scripting projects monitoring and reporting"
git push origin main
```

---

# Day 12 Outcome

✅ CSV Processing

✅ Log Analysis

✅ Monitoring Scripts

✅ Report Generation

✅ Backup Automation

✅ User Auditing

✅ Service Monitoring

✅ Inventory Reporting

✅ Production Automation Scripts

✅ Mini Real-World Projects

You can now build complete Linux Administration and DevOps automation scripts that interact with files, logs, services, users, backups, and system resources.