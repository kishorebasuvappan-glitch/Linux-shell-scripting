# Day 03 - Linux Users, Groups, Permissions & Sudo

# Learning Objectives

By the end of Day 03, you should understand:

- Linux Users
- Linux Groups
- User Management
- Group Management
- File Ownership
- File Permissions
- chmod
- chown
- chgrp
- umask
- sudo
- passwd
- Real-world Linux Administration Tasks

---

# Linux User Concepts

In Linux, every process runs as a user.

Types:

## Root User

Super administrator.

User ID:

```bash
0
```

Check:

```bash
id root
```

---

## Normal User

Regular users.

Example:

```bash
kishore
john
admin
```

---

## System Users

Used by services.

Examples:

```bash
nginx
mysql
apache
```

---

# User Information Commands

## whoami

Current user.

```bash
whoami
```

---

## id

Display user information.

```bash
id
```

Example:

```bash
uid=1000(kishore)
gid=1000(kishore)
groups=1000(kishore)
```

---

## who

Logged-in users.

```bash
who
```

---

## w

Logged-in users and activity.

```bash
w
```

---

## users

Display logged-in usernames.

```bash
users
```

---

## logname

Current login name.

```bash
logname
```

---

# User Management

---

## useradd

Create new user.

```bash
sudo useradd devops
```

Verify:

```bash
id devops
```

---

Create user with home directory:

```bash
sudo useradd -m devops
```

---

Specify shell:

```bash
sudo useradd -m -s /bin/bash devops
```

---

# passwd

Set user password.

```bash
sudo passwd devops
```

---

Lock user:

```bash
sudo passwd -l devops
```

---

Unlock user:

```bash
sudo passwd -u devops
```

---

Expire password:

```bash
sudo passwd -e devops
```

---

# usermod

Modify user.

Change shell:

```bash
sudo usermod -s /bin/bash devops
```

---

Add to group:

```bash
sudo usermod -aG docker devops
```

---

Lock account:

```bash
sudo usermod -L devops
```

---

Unlock account:

```bash
sudo usermod -U devops
```

---

# userdel

Delete user.

```bash
sudo userdel devops
```

Delete with home directory:

```bash
sudo userdel -r devops
```

---

# Group Management

Groups simplify permission management.

---

## groupadd

Create group.

```bash
sudo groupadd developers
```

---

## groupdel

Delete group.

```bash
sudo groupdel developers
```

---

## groupmod

Rename group.

```bash
sudo groupmod -n devops developers
```

---

# groups

Display group membership.

```bash
groups
```

---

Display user's group.

```bash
groups devops
```

---

# Ownership

View ownership:

```bash
ls -l
```

Example:

```bash
-rw-r--r-- 1 kishore devops file.txt
```

Owner:

```bash
kishore
```

Group:

```bash
devops
```

---

# chown

Change ownership.

```bash
sudo chown devops file.txt
```

---

Change owner and group:

```bash
sudo chown devops:developers file.txt
```

---

Recursive ownership:

```bash
sudo chown -R devops:developers project/
```

---

# chgrp

Change group only.

```bash
sudo chgrp developers file.txt
```

---

# Linux Permissions

View:

```bash
ls -l
```

Example:

```bash
-rwxr-xr--
```

---

Permission Breakdown

```text
-rwxr-xr--
```

First character:

```text
-
```

File

```text
d
```

Directory

---

Owner:

```text
rwx
```

Group:

```text
r-x
```

Others:

```text
r--
```

---

# Permission Meaning

## Read

```text
r = 4
```

Read file.

---

## Write

```text
w = 2
```

Modify file.

---

## Execute

```text
x = 1
```

Run file.

---

# chmod Symbolic Method

Add permission:

```bash
chmod u+x script.sh
```

---

Remove permission:

```bash
chmod g-w file.txt
```

---

Others read:

```bash
chmod o+r file.txt
```

---

All execute:

```bash
chmod a+x script.sh
```

---

# chmod Numeric Method

Most important for interviews.

---

## 777

```bash
chmod 777 test.sh
```

```text
rwx rwx rwx
```

---

## 755

```bash
chmod 755 script.sh
```

```text
rwx r-x r-x
```

---

## 700

```bash
chmod 700 secret.sh
```

```text
rwx --- ---
```

---

## 644

```bash
chmod 644 file.txt
```

```text
rw- r-- r--
```

---

## 600

```bash
chmod 600 password.txt
```

```text
rw- --- ---
```

---

# Permission Calculation

```text
Read      4
Write     2
Execute   1
```

Examples:

```text
7 = 4+2+1 = rwx
6 = 4+2   = rw-
5 = 4+1   = r-x
4 = 4     = r--
```

---

# Recursive Permission

Directory:

```bash
chmod -R 755 project
```

---

# umask

Default permissions.

View:

```bash
umask
```

Example:

```bash
0022
```

---

Calculate:

```text
File Default = 666
Directory Default = 777
```

Example:

```text
666 - 022 = 644
777 - 022 = 755
```

---

Change temporarily:

```bash
umask 027
```

---

# sudo

Run commands as another user.

```bash
sudo ls /root
```

---

Switch user:

```bash
sudo su -
```

---

Execute command as another user:

```bash
sudo -u devops whoami
```

---

# Switch Users

## su

Switch user.

```bash
su - devops
```

---

Switch root:

```bash
su -
```

---

Return:

```bash
exit
```

---

# Important Files

---

Users:

```bash
cat /etc/passwd
```

---

Passwords:

```bash
cat /etc/shadow
```

(root only)

---

Groups:

```bash
cat /etc/group
```

---

# Practical Lab

Create users:

```bash
sudo useradd -m user1
sudo useradd -m user2
```

---

Create group:

```bash
sudo groupadd devops
```

---

Add users:

```bash
sudo usermod -aG devops user1
sudo usermod -aG devops user2
```

---

Create file:

```bash
touch project.txt
```

---

Change ownership:

```bash
sudo chown user1:devops project.txt
```

---

Set permissions:

```bash
chmod 644 project.txt
```

---

Verify:

```bash
ls -l project.txt
```

---

# Commands to Master Today

```bash
whoami
id
who
w
users
logname

useradd
usermod
userdel

passwd

groupadd
groupmod
groupdel

groups

chmod
chown
chgrp

umask

sudo
su

exit
```

---

# Interview Questions

### Difference between useradd and usermod?

### Difference between chmod and chown?

### Difference between su and sudo?

### What is UID?

### What is GID?

### What is root user?

### Meaning of chmod 777?

### Meaning of chmod 755?

### Meaning of chmod 644?

### How do you add a user to a group?

```bash
usermod -aG group user
```

### How do you see user groups?

```bash
groups username
```

---

# Common Permissions Used in Real Projects

```bash
755  Scripts
644  Configuration Files
600  Password Files
700  Private Scripts
775  Shared Directories
```

---

# Day 03 Outcome

✅ Users Management

✅ Groups Management

✅ Ownership

✅ File Permissions

✅ chmod

✅ chown

✅ chgrp

✅ umask

✅ sudo

✅ Linux Security Fundamentals

You now understand the permission model used across Linux servers, Docker hosts, Kubernetes nodes, Jenkins servers, and cloud environments.
