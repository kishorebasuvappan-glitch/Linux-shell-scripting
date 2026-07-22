# Day 05 - Process Management, Services & Job Control

# Learning Objectives

By the end of Day 05, you should be able to:

- Understand Linux Processes
- Monitor Running Processes
- Manage Background Jobs
- Kill Processes
- Change Process Priority
- Run Long Tasks in Background
- Manage Services
- View System Logs
- Understand Linux Boot Services

These topics are used daily by:

- Linux Administrators
- DevOps Engineers
- SRE Engineers
- Cloud Engineers

---

# What is a Process?

A process is a running instance of a program.

Examples:

```bash
nginx
apache2
sshd
docker
java
python
```

Every process has a unique:

```bash
PID (Process ID)
```

---

# View Running Processes

## ps

Display current processes.

```bash
ps
```

---

Detailed output:

```bash
ps -ef
```

Example:

```text
UID      PID   PPID
root       1      0
root     500      1
kishore  704    500
```

---

Show all processes:

```bash
ps aux
```

---

Search processes:

```bash
ps -ef | grep nginx
```

---

Search Java process:

```bash
ps -ef | grep java
```

---

# Process Tree

## pstree

Display process hierarchy.

```bash
pstree
```

---

Install:

```bash
sudo apt install psmisc
```

---

Show PIDs:

```bash
pstree -p
```

---

# Real Time Process Monitoring

## top

Interactive process monitor.

```bash
top
```

Important fields:

```text
PID
USER
CPU
MEM
TIME
COMMAND
```

---

Quit:

```text
q
```

---

Sort by memory:

```text
Shift + M
```

---

Sort by CPU:

```text
Shift + P
```

---

# htop

Improved version of top.

Install:

```bash
sudo apt install htop
```

Run:

```bash
htop
```

Benefits:

- Colorful
- Interactive
- Easy process killing

---

# Process IDs

Find process PID:

```bash
pidof nginx
```

---

Example:

```bash
pidof sshd
```

---

# pgrep

Find process by name.

```bash
pgrep nginx
```

---

Show names:

```bash
pgrep -l nginx
```

---

# Kill Processes

## kill

Terminate process by PID.

Syntax:

```bash
kill PID
```

Example:

```bash
kill 1234
```

---

# Common Signals

Signal 15

```bash
kill -15 PID
```

Graceful shutdown.

---

Signal 9

```bash
kill -9 PID
```

Force kill.

---

Signal 1

```bash
kill -1 PID
```

Reload process.

---

View signals:

```bash
kill -l
```

---

# pkill

Kill process by name.

```bash
pkill nginx
```

---

Kill Java process:

```bash
pkill java
```

---

# killall

Kill all matching processes.

```bash
killall nginx
```

---

# Foreground and Background Jobs

---

Run normally:

```bash
sleep 100
```

Terminal occupied.

---

Run in background:

```bash
sleep 100 &
```

Output:

```text
[1] 1000
```

---

# jobs

Display background jobs.

```bash
jobs
```

---

Output:

```text
[1]+ Running sleep 100 &
```

---

# bg

Resume in background.

```bash
bg
```

---

# fg

Bring job to foreground.

```bash
fg
```

---

# Ctrl + Z

Suspend process.

Example:

```bash
sleep 500
```

Press:

```text
CTRL + Z
```

Then:

```bash
bg
```

---

# nohup

Run process after logout.

```bash
nohup ./app.sh &
```

---

Output:

```text
nohup.out
```

---

Example:

```bash
nohup java -jar app.jar &
```

Used frequently in production.

---

# Process Priority

## nice

Run process with priority.

```bash
nice -n 10 sleep 100
```

---

View priority:

```bash
top
```

---

# renice

Change running process priority.

```bash
renice 10 -p 1234
```

---

# System Uptime

## uptime

Display server uptime.

```bash
uptime
```

Example:

```text
10:00 up 15 days
```

---

# System Load

```bash
uptime
```

Output:

```text
load average: 0.20 0.30 0.40
```

Meaning:

```text
1 minute
5 minute
15 minute
```

---

# Memory Monitoring

## free

Display memory.

```bash
free
```

---

Human readable:

```bash
free -h
```

---

Refresh:

```bash
watch free -h
```

---

# CPU Information

## lscpu

Display CPU details.

```bash
lscpu
```

---

# Memory Information

## vmstat

Performance statistics.

```bash
vmstat
```

---

Every 2 seconds:

```bash
vmstat 2
```

---

# Service Management

Modern Linux uses:

```bash
systemd
```

---

# systemctl

Most Important Command

---

Check status:

```bash
systemctl status ssh
```

---

Start service:

```bash
sudo systemctl start nginx
```

---

Stop service:

```bash
sudo systemctl stop nginx
```

---

Restart:

```bash
sudo systemctl restart nginx
```

---

Reload:

```bash
sudo systemctl reload nginx
```

---

Enable at boot:

```bash
sudo systemctl enable nginx
```

---

Disable:

```bash
sudo systemctl disable nginx
```

---

View all services:

```bash
systemctl list-units --type=service
```

---

Check failed services:

```bash
systemctl --failed
```

---

# Service Command

Older Linux distributions.

```bash
service nginx status
```

---

Start service:

```bash
service nginx start
```

---

Stop:

```bash
service nginx stop
```

---

# Logs

## journalctl

View system logs.

---

Complete logs:

```bash
journalctl
```

---

Latest logs:

```bash
journalctl -xe
```

---

Last 50 entries:

```bash
journalctl -n 50
```

---

Live logs:

```bash
journalctl -f
```

---

Logs for service:

```bash
journalctl -u nginx
```

---

Today's logs:

```bash
journalctl --since today
```

---

# Important Log Locations

Ubuntu:

```bash
/var/log/syslog
```

---

Authentication:

```bash
/var/log/auth.log
```

---

Kernel:

```bash
dmesg
```

---

# dmesg

Kernel logs.

```bash
dmesg
```

---

Latest kernel logs:

```bash
dmesg | tail
```

---

Hardware errors:

```bash
dmesg | grep error
```

---

# watch

Run command repeatedly.

```bash
watch date
```

---

Monitor memory:

```bash
watch free -h
```

---

Monitor processes:

```bash
watch ps -ef
```

---

# Practical Lab

Start background process:

```bash
sleep 300 &
```

---

View jobs:

```bash
jobs
```

---

Find PID:

```bash
ps -ef | grep sleep
```

---

Kill process:

```bash
kill PID
```

---

Check memory:

```bash
free -h
```

---

View CPU:

```bash
lscpu
```

---

View uptime:

```bash
uptime
```

---

Check services:

```bash
systemctl list-units --type=service
```

---

Monitor logs:

```bash
journalctl -n 20
```

---

# Commands to Master Today

```bash
ps
ps -ef
ps aux

pstree

top
htop

pidof
pgrep

kill
kill -9
kill -15
killall
pkill

jobs
bg
fg

nohup

nice
renice

uptime

free
free -h

vmstat

lscpu

systemctl

service

journalctl

dmesg

watch
```

---

# Interview Questions

### What is PID?

Process ID.

---

### Difference between process and service?

Process = Running program

Service = Background process managed by system

---

### Difference between kill and kill -9?

```bash
kill
```

Graceful termination.

```bash
kill -9
```

Force termination.

---

### Difference between kill and pkill?

```bash
kill
```

Uses PID.

```bash
pkill
```

Uses process name.

---

### What is top command?

Real-time process monitoring.

---

### What is nohup?

Runs process even after logout.

---

### What is systemctl?

Manage Linux services.

---

### How do you see memory usage?

```bash
free -h
```

---

### How do you monitor logs continuously?

```bash
journalctl -f
```

or

```bash
tail -f logfile
```

---

### How do you check service status?

```bash
systemctl status nginx
```

---

# Real Production Commands

Check Java Processes:

```bash
ps -ef | grep java
```

---

Restart Service:

```bash
sudo systemctl restart nginx
```

---

Check Failed Services:

```bash
systemctl --failed
```

---

Watch Logs:

```bash
journalctl -u nginx -f
```

---

Check Server Load:

```bash
uptime
```

---

Check Memory:

```bash
free -h
```

---

Check Disk Usage:

```bash
df -h
```

---

# Git Commit

```bash
git add Day05/
git commit -m "Day 05 - Process Management and Services"
```

Or:

```bash
git add .
git commit -m "Day 05 Linux process monitoring and service management"
git push origin main
```

---

# Day 05 Outcome

✅ Process Management

✅ Process Monitoring

✅ kill / pkill

✅ Background Jobs

✅ nohup

✅ CPU & Memory Monitoring

✅ Service Management

✅ systemctl

✅ journalctl

✅ Linux Troubleshooting

✅ Production Support Basics

You now have the core Linux Administration foundation required before starting Shell Scripting (Day 06 onwards).
