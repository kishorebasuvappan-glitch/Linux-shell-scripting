# Day 13 - Advanced Linux Administration, Monitoring & Performance Troubleshooting

## Learning Objectives

By the end of Day 13, you should be able to:

- Monitor CPU, Memory, Disk and Network
- Troubleshoot Linux performance issues
- Analyze running processes
- Identify resource bottlenecks
- Monitor system logs
- Check open files
- Monitor network connections
- Perform production server health checks
- Create system monitoring scripts

---

# Why Monitoring Matters

In production environments, users don't complain:

```text
CPU usage = 90%
Memory = 95%
Disk Full
```

They complain:

```text
Application Slow
Website Down
Database Not Responding
```

As a Linux Admin or DevOps Engineer, your job is to identify the root cause.

---

# System Load

## uptime

Display uptime and load averages.

```bash
uptime
```

Example:

```text
10:00:00 up 15 days, 3 users, load average: 0.20, 0.35, 0.50
```

---

## Understanding Load Average

```text
0.20 = Last 1 minute
0.35 = Last 5 minutes
0.50 = Last 15 minutes
```

General rule:

```text
Load < CPU Cores = Healthy
Load > CPU Cores = High Load
```

---

# CPU Monitoring

## top

Real-time process monitoring.

```bash
top
```

Important fields:

```text
PID
USER
CPU
MEM
COMMAND
```

---

## Sort by CPU

Inside top:

```text
Shift + P
```

---

# htop

Enhanced top.

Install:

```bash
sudo apt install htop
```

Run:

```bash
htop
```

Benefits:

- Colorful Interface
- Process Search
- Easy Process Kill

---

# CPU Information

## lscpu

```bash
lscpu
```

Example:

```text
CPU(s): 4
Model name: Intel Xeon
```

---

# Number of CPUs

```bash
nproc
```

Output:

```text
4
```

---

# Memory Monitoring

## free

```bash
free -h
```

Example:

```text
Mem: 8Gi
Used: 3Gi
Free: 5Gi
```

---

## Refresh Continuously

```bash
watch free -h
```

---

# vmstat

Display memory statistics.

```bash
vmstat
```

Continuous:

```bash
vmstat 2
```

---

# Process Monitoring

## ps

Display processes.

```bash
ps -ef
```

---

Search process:

```bash
ps -ef | grep nginx
```

---

## pgrep

```bash
pgrep nginx
```

Display PID and Name:

```bash
pgrep -l nginx
```

---

## pidof

```bash
pidof sshd
```

---

# Kill Processes

Graceful:

```bash
kill PID
```

---

Force:

```bash
kill -9 PID
```

---

By Name:

```bash
pkill nginx
```

---

# Disk Monitoring

## df

Filesystem usage.

```bash
df -h
```

Example:

```text
Filesystem Size Used Avail Use%
/dev/sda1 100G 60G 40G 60%
```

---

# Directory Usage

## du

Directory size.

```bash
du -sh /var/log
```

---

Top directories:

```bash
du -sh *
```

---

# Find Large Files

```bash
find / -type f -size +500M
```

---

Largest Files

```bash
du -ah / | sort -hr | head
```

---

# Open Files

## lsof

List open files.

```bash
lsof
```

---

Files opened by pid:

```bash
lsof -p 1234
```

---

Files used by process:

```bash
lsof | grep nginx
```

---

# Network Monitoring

## ip

Display IP Address.

```bash
ip a
```

---

Routing Table:

```bash
ip route
```

---

# Ping

```bash
ping google.com
```

---

Limited requests:

```bash
ping -c 4 google.com
```

---

# ss

Modern replacement for netstat.

Display listening ports:

```bash
ss -tulnp
```

---

Display TCP sessions:

```bash
ss -tn
```

---

# netstat

Older command.

```bash
netstat -tulnp
```

---

# DNS Testing

## nslookup

```bash
nslookup google.com
```

---

## dig

```bash
dig google.com
```

---

# Network Connectivity

## curl

Check website response.

```bash
curl https://google.com
```

---

Show headers:

```bash
curl -I https://google.com
```

---

# Download Files

## wget

```bash
wget https://example.com/file.zip
```

---

# Log Monitoring

## journalctl

System logs.

```bash
journalctl -xe
```

---

Specific Service:

```bash
journalctl -u ssh
```

---

Live logs:

```bash
journalctl -f
```

---

# Traditional Logs

System log:

```bash
tail -f /var/log/syslog
```

---

Authentication log:

```bash
tail -f /var/log/auth.log
```

---

# Kernel Messages

## dmesg

```bash
dmesg
```

---

Errors only:

```bash
dmesg | grep -i error
```

---

# Service Troubleshooting

Check status:

```bash
systemctl status nginx
```

---

Restart Service:

```bash
sudo systemctl restart nginx
```

---

Failed Services:

```bash
systemctl --failed
```

---

# Production Health Check Script

```bash
#!/bin/bash

echo "Hostname : $(hostname)"

echo "Date : $(date)"

echo

echo "Disk Usage"
df -h

echo

echo "Memory Usage"
free -h

echo

echo "CPU Load"
uptime
```

---

# Disk Alert Script

```bash
#!/bin/bash

usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$usage" -gt 80 ]
then
    echo "Disk Alert : $usage%"
fi
```

---

# Service Monitoring Script

```bash
#!/bin/bash

services=("ssh" "cron")

for svc in "${services[@]}"
do
    systemctl is-active "$svc"
done
```

---

# Process Monitoring Script

```bash
#!/bin/bash

ps aux --sort=-%mem | head
```

Show top memory-consuming processes.

---

# Commands to Master Today

```bash
uptime

top
htop

lscpu
nproc

free
vmstat

ps
pgrep
pidof

kill
pkill

df
du

find

lsof

ip

ping

ss
netstat

curl
wget

dig
nslookup

journalctl

tail -f

dmesg

systemctl
```

---

# Interview Questions

## What is Load Average?

Average system load during:

```text
1 minute
5 minutes
15 minutes
```

---

## Difference Between top and ps?

top

```text
Real-time
```

ps

```text
Snapshot
```

---

## How do you check memory usage?

```bash
free -h
```

---

## How do you check disk usage?

```bash
df -h
```

---

## How do you find large files?

```bash
find / -type f -size +500M
```

---

## How do you check listening ports?

```bash
ss -tulnp
```

---

## How do you monitor logs?

```bash
tail -f logfile
```

or

```bash
journalctl -f
```

---

## How do you identify high CPU processes?

```bash
top
```

or

```bash
ps aux --sort=-%cpu
```

---

# Lab Exercises

## Lab 1

Display:

```bash
CPU Information
Memory Information
Disk Information
```

---

## Lab 2

Create:

```bash
diskcheck.sh
```

Alert if disk usage exceeds:

```text
80%
```

---

## Lab 3

Display:

```bash
Top 10 Memory Consuming Processes
```

---

## Lab 4

Display:

```bash
Open Ports
```

Using:

```bash
ss -tulnp
```

---

## Lab 5

Create:

```bash
healthcheck.sh
```

Display:

```text
Hostname
Date
CPU
Memory
Disk
Load Average
```

---

# Git Commit

```bash
git add Day13/
git commit -m "Day 13 Linux Monitoring and Performance Troubleshooting"
```

Or

```bash
git add .
git commit -m "Day 13 system monitoring performance tuning and troubleshooting"
git push origin main
```

---

# Day 13 Outcome

✅ CPU Monitoring

✅ Memory Monitoring

✅ Disk Monitoring

✅ Process Analysis

✅ Network Monitoring

✅ Log Analysis

✅ Service Troubleshooting

✅ Performance Investigation

✅ Health Check Scripts

✅ Production Server Monitoring

You can now monitor and troubleshoot Linux servers like a Linux Administrator, Production Support Engineer, or DevOps Engineer in real-world environments.