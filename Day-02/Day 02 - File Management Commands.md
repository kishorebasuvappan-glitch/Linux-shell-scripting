# Day 02 - File Management Commands

# Learning Objectives

By the end of Day 02, you should be able to:

- Create files
- View file contents
- Copy files and directories
- Move and rename files
- Delete files and directories
- Search files
- Understand file types
- View file metadata
- Use wildcards efficiently
- Work like a Linux Administrator

---

# Creating Files

## touch

Create an empty file.

```bash
touch file1.txt
```

Verify:

```bash
ls
```

---

Create multiple files:

```bash
touch file1.txt file2.txt file3.txt
```

---

Create files with numbers:

```bash
touch file{1..10}.txt
```

Output:

```bash
file1.txt
file2.txt
file3.txt
...
file10.txt
```

---

# Viewing File Contents

## cat

Display complete file content.

```bash
cat file1.txt
```

---

Create content:

```bash
echo "Hello Linux" > file1.txt
```

View:

```bash
cat file1.txt
```

Output:

```bash
Hello Linux
```

---

View multiple files:

```bash
cat file1.txt file2.txt
```

---

Show line numbers:

```bash
cat -n file1.txt
```

---

## tac

Reverse display.

```bash
tac file1.txt
```

---

# less

Large file viewing.

```bash
less /etc/passwd
```

Navigation:

```text
Space  Next Page
b      Previous Page
q      Quit
```

---

# more

Older pager utility.

```bash
more /etc/passwd
```

---

# head

Display first 10 lines.

```bash
head file1.txt
```

---

First 5 lines:

```bash
head -5 file1.txt
```

---

# tail

Display last 10 lines.

```bash
tail file1.txt
```

---

Last 5 lines:

```bash
tail -5 file1.txt
```

---

Monitor logs continuously:

```bash
tail -f /var/log/syslog
```

or

```bash
tail -f /var/log/messages
```

Very important for DevOps Engineers.

---

# Copy Files

## cp

Copy file.

```bash
cp file1.txt backup.txt
```

Verify:

```bash
ls
```

---

Copy multiple files:

```bash
cp file1.txt file2.txt backup/
```

---

Copy entire directory:

```bash
cp -r logs backup/
```

---

Preserve permissions:

```bash
cp -p file1.txt file2.txt
```

---

Verbose copy:

```bash
cp -v file1.txt file2.txt
```

---

# Move and Rename

## mv

Rename file.

```bash
mv old.txt new.txt
```

---

Move file:

```bash
mv file1.txt /tmp
```

---

Move multiple files:

```bash
mv *.log logs/
```

---

Rename directory:

```bash
mv olddir newdir
```

---

# Delete Files

## rm

Delete file.

```bash
rm file1.txt
```

---

Delete multiple files:

```bash
rm file1.txt file2.txt
```

---

Delete with confirmation:

```bash
rm -i file1.txt
```

---

Force delete:

```bash
rm -f file1.txt
```

---

Delete directory recursively:

```bash
rm -r project
```

---

Force delete directory:

```bash
rm -rf project
```

⚠️ Most dangerous Linux command:

```bash
rm -rf
```

Always verify path before running.

---

# Remove Directories

## rmdir

Delete empty directory.

```bash
rmdir logs
```

---

Delete multiple directories:

```bash
rmdir logs backup configs
```

---

# Search Files

## find

Most important Linux search command.

---

Find file:

```bash
find /home -name test.txt
```

---

Find shell scripts:

```bash
find . -name "*.sh"
```

---

Find log files:

```bash
find /var -name "*.log"
```

---

Find directories:

```bash
find . -type d
```

---

Find files only:

```bash
find . -type f
```

---

Find empty files:

```bash
find . -empty
```

---

Find files larger than 100 MB:

```bash
find / -size +100M
```

---

Find files modified today:

```bash
find . -mtime 0
```

---

Find and delete:

```bash
find . -name "*.tmp" -delete
```

Use carefully.

---

# locate

Fast file search.

Install:

```bash
sudo apt install mlocate
```

Update database:

```bash
sudo updatedb
```

Search:

```bash
locate passwd
```

---

Difference:

```text
find    = Real-time search
locate  = Database search
```

---

# File Type Identification

## file

Identify file type.

```bash
file test.txt
```

Output:

```bash
ASCII text
```

---

Shell script:

```bash
file backup.sh
```

Output:

```bash
Bourne-Again shell script
```

---

Binary:

```bash
file /bin/ls
```

Output:

```bash
ELF executable
```

---

# File Information

## stat

Detailed metadata.

```bash
stat file1.txt
```

Output includes:

- Size
- Permissions
- Owner
- Group
- Access Time
- Modify Time

---

# Display Disk Usage

## du

Directory size.

```bash
du
```

---

Human readable:

```bash
du -h
```

---

Directory size:

```bash
du -sh logs
```

---

# Display File Sizes

```bash
ls -lh
```

---

# Display Filesystem Usage

## df

Filesystem information.

```bash
df
```

---

Human readable:

```bash
df -h
```

---

# Wildcards

Very important for administration.

---

## *

Matches everything.

```bash
ls *
```

---

Copy all text files:

```bash
cp *.txt backup/
```

---

Delete all logs:

```bash
rm *.log
```

---

## ?

Single character.

```bash
ls test?.txt
```

Matches:

```bash
test1.txt
test2.txt
```

---

## []

Character range.

```bash
ls file[1-5].txt
```

---

Examples:

```bash
file1.txt
file2.txt
file3.txt
```

---

# Redirect Output

## >

Overwrite output.

```bash
echo "Linux" > file.txt
```

---

## >>

Append output.

```bash
echo "DevOps" >> file.txt
```

---

View:

```bash
cat file.txt
```

---

# Practical Lab

Create directory:

```bash
mkdir Day02Lab
cd Day02Lab
```

---

Create files:

```bash
touch app.log
touch db.log
touch nginx.log

touch user1.txt
touch user2.txt
touch user3.txt
```

---

List:

```bash
ls -la
```

---

Copy:

```bash
cp *.txt backup/
```

---

Move:

```bash
mv *.log logs/
```

---

Search:

```bash
find . -name "*.txt"
```

---

Show file type:

```bash
file user1.txt
```

---

Display metadata:

```bash
stat user1.txt
```

---

# Commands to Master Today

```bash
touch
cat
cat -n
tac
less
more
head
tail
tail -f
cp
cp -r
cp -p
cp -v
mv
rm
rm -r
rm -rf
rmdir
find
locate
updatedb
file
stat
du
du -sh
df
df -h
echo
>
>>
```

---

# Interview Questions

### Difference between cp and mv?

### Difference between rm and rmdir?

### Difference between find and locate?

### Difference between > and >>?

### Difference between cat and less?

### Difference between du and df?

### What does tail -f do?

### How do you find all shell scripts in a directory?

```bash
find . -name "*.sh"
```

### How do you find files larger than 1GB?

```bash
find / -size +1G
```

### How do you identify file type?

```bash
file filename
```

---

# Day 02 Outcome

✅ File Creation

✅ File Viewing

✅ File Copying

✅ File Moving

✅ File Renaming

✅ File Deletion

✅ File Searching

✅ File Metadata Analysis

✅ Wildcards

✅ Disk Usage Monitoring

✅ Redirection Operators

These are core Linux Administration skills used daily by Linux Admins, DevOps Engineers, SREs, and Cloud Engineers.
