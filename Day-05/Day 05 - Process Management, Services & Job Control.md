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
