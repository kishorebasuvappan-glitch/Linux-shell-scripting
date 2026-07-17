# Day 01 - Linux Fundamentals & Basic Commands

# Learning Objectives

By the end of Day 01, you should understand:

- What Linux is
- Linux Architecture
- Linux Filesystem
- Absolute vs Relative Paths
- Terminal Navigation
- File System Exploration
- Hidden Files
- Command Syntax
- Command Help System

---

# What is Linux?

Linux is an open-source operating system.

It is used in:

- Web Servers
- Cloud Computing
- DevOps
- Containers
- Kubernetes
- Networking
- Databases
- Cyber Security

Examples:

- Ubuntu
- Debian
- Rocky Linux
- RHEL
- CentOS
- Oracle Linux
- Amazon Linux

---

# Linux Architecture

```text
+--------------------+
| User               |
+--------------------+
| Shell              |
+--------------------+
| Kernel             |
+--------------------+
| Hardware           |
+--------------------+
```

## User

Person using the system.

---

## Shell

Interface between user and kernel.

Examples:

```bash
bash
sh
ksh
zsh
```

Check current shell:

```bash
echo $SHELL
```

Example:

```bash
/bin/bash
```

---

## Kernel

Responsible for:

- Memory Management
- Process Management
- CPU Scheduling
- Device Management
- File System Management

Kernel information:

```bash
uname -r
```

Example:

```bash
6.8.0-40-generic
```

---

# Linux Filesystem

Everything starts from:

```bash
/
```

This is called the Root Directory.

---

# Standard Linux Directories

```text
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── srv
├── sys
├── tmp
├── usr
└── var
```

---

## Important Directories

### /home

User home directories.

```bash
/home/kishore
```

---

### /root

Root user home.

```bash
/root
```

---

### /etc

Configuration files.

Examples:

```bash
/etc/passwd
/etc/hosts
/etc/fstab
```

---

### /var

Log files.

```bash
/var/log
```

---

### /tmp

Temporary files.

---

### /usr

Installed software.

---

# Absolute Path

Starts from /

Example:

```bash
/home/kishore/scripts/test.sh
```

---

# Relative Path

Starts from current directory.

Example:

```bash
scripts/test.sh
```

---

# Navigation Commands

---

## pwd

Print Working Directory

```bash
pwd
```

Output:

```bash
/home/kishore
```

---

## whoami

Display current user.

```bash
whoami
```

Example:

```bash
kishore
```

---

## hostname

Display server hostname.

```bash
hostname
```

---

## hostnamectl

Detailed hostname information.

```bash
hostnamectl
```

---

## uname

Kernel information.

```bash
uname
```

---

## uname -a

Complete system information.

```bash
uname -a
```

---

## date

Current date and time.

```bash
date
```

---

## cal

Calendar.

```bash
cal
```

Current month:

```bash
cal
```

Full year:

```bash
cal 2026
```

---

# Directory Navigation

---

## ls

List files.

```bash
ls
```

---

## ls -l

Long format.

```bash
ls -l
```

---

## ls -la

Show hidden files.

```bash
ls -la
```

---

## ls -lh

Human readable sizes.

```bash
ls -lh
```

---

## ls -ltr

Latest files at bottom.

```bash
ls -ltr
```

---

## ls -R

Recursive listing.

```bash
ls -R
```

---

## cd

Change directory.

```bash
cd Documents
```

---

Go Home:

```bash
cd
```

or

```bash
cd ~
```

---

Go Root:

```bash
cd /
```

---

Go Previous Directory:

```bash
cd -
```

---

Move One Level Up:

```bash
cd ..
```

---

Move Two Levels Up:

```bash
cd ../..
```

---

# File Exploration Commands

---

## tree

Display directory structure.

```bash
tree
```

Install:

```bash
sudo apt install tree
```

---

## file

Identify file type.

```bash
file test.sh
```

Output:

```bash
shell script
```

---

## stat

Detailed file information.

```bash
stat filename
```

---

# Hidden Files

Files beginning with:

```bash
.
```

Examples:

```bash
.bashrc
.profile
.gitconfig
```

View:

```bash
ls -la
```

---

# Create Practice Directories

Create one directory:

```bash
mkdir scripts
```

---

Create multiple:

```bash
mkdir scripts logs backup configs
```

---

Verify:

```bash
ls
```

---

Create nested folders:

```bash
mkdir -p project/app/config
```

---

# Linux Help System

One of the most important topics for administrators.

---

## man

Manual pages.

```bash
man ls
```

Search inside man:

```bash
/help
```

Quit:

```bash
q
```

---

## whatis

One-line command description.

```bash
whatis ls
```

---

## apropos

Search commands.

```bash
apropos password
```

---

## info

Detailed documentation.

```bash
info ls
```

---

## --help

Built-in help.

```bash
ls --help
```

```bash
mkdir --help
```

```bash
cp --help
```

---

# Command Syntax

General format:

```bash
command [options] [arguments]
```

Example:

```bash
ls -la /etc
```

Command:

```bash
ls
```

Option:

```bash
-la
```

Argument:

```bash
/etc
```

---

# Environment Variables

Display current user:

```bash
echo $USER
```

Home Directory:

```bash
echo $HOME
```

Shell:

```bash
echo $SHELL
```

Path Variable:

```bash
echo $PATH
```

---

# History Command

Show previously executed commands.

```bash
history
```

Last 20 commands:

```bash
history 20
```

Clear terminal:

```bash
clear
```

Shortcut:

```bash
Ctrl + L
```

---

# Essential Keyboard Shortcuts

Move cursor to beginning:

```text
Ctrl + A
```

Move cursor to end:

```text
Ctrl + E
```

Clear screen:

```text
Ctrl + L
```

Cancel command:

```text
Ctrl + C
```

Suspend process:

```text
Ctrl + Z
```

Search command history:

```text
Ctrl + R
```

---

# Practice Lab

Create structure:

```bash
mkdir -p Linux-Learning/Day01
cd Linux-Learning/Day01

mkdir scripts
mkdir notes
mkdir logs
mkdir backup
```

Verify:

```bash
tree
```

---

# Commands to Master Today

```bash
pwd
whoami
hostname
hostnamectl
uname
uname -a
date
cal
ls
ls -l
ls -la
ls -lh
ls -ltr
ls -R
cd
cd ..
cd -
cd /
cd ~
mkdir
mkdir -p
tree
file
stat
echo
history
clear
man
whatis
apropos
info
```

---

# Day 01 Interview Questions

### What is Linux?

### What is Kernel?

### What is Shell?

### Difference between Absolute and Relative Path?

### Difference between /root and /home?

### What is a hidden file?

### Difference between ls and ls -la?

### Difference between pwd and cd?

### What is PATH variable?

### How do you get command help?

---

# Day 01 Outcome

After today's session you should:

✅ Navigate confidently in Linux

✅ Understand Linux filesystem hierarchy

✅ Use Linux help systems

✅ Understand shell basics

✅ Work with directories

✅ Understand hidden files

✅ Understand command syntax

✅ Be ready for file management commands in Day 02
