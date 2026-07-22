# Day 04 - Text Processing Commands (Linux Admin & DevOps)

# Learning Objectives

By the end of Day 04, you should be able to:

- Search text efficiently
- Filter log files
- Extract columns
- Replace text
- Sort data
- Remove duplicates
- Count words and lines
- Process application logs
- Analyze server files
- Work with pipelines

These commands are used daily by:

- Linux Administrators
- DevOps Engineers
- SRE Engineers
- Cloud Engineers
- Support Teams

---

# Sample File

Create practice file:

```bash
cat > employees.txt
```

Paste:

```text
101,Kishore,DevOps,90000
102,John,Linux,85000
103,David,AWS,95000
104,Mike,DevOps,92000
105,Alex,Azure,99000
```

Save:

```text
CTRL + D
```

---

# grep

Search text patterns.

Most used Linux command.

---

## Basic Search

```bash
grep Kishore employees.txt
```

Output:

```text
101,Kishore,DevOps,90000
```

---

## Case Insensitive

```bash
grep -i devops employees.txt
```

---

## Show Line Numbers

```bash
grep -n DevOps employees.txt
```

---

## Count Matches

```bash
grep -c DevOps employees.txt
```

---

## Invert Match

Show lines NOT containing DevOps.

```bash
grep -v DevOps employees.txt
```

---

## Recursive Search

```bash
grep -r "error" /var/log
```

---

## Search Multiple Files

```bash
grep "root" /etc/passwd
```

---

## Highlight Result

```bash
grep --color DevOps employees.txt
```

---

# egrep

Extended grep.

```bash
grep -E "DevOps|AWS" employees.txt
```

---

# Regular Expressions

---

Starts with:

```bash
grep "^101" employees.txt
```

---

Ends with:

```bash
grep "90000$" employees.txt
```

---

Any digit:

```bash
grep "[0-9]" employees.txt
```

---

Only DevOps or AWS

```bash
grep -E "DevOps|AWS" employees.txt
```

---

# cut

Extract columns.

---

Display first column

```bash
cut -d',' -f1 employees.txt
```

---

Display names

```bash
cut -d',' -f2 employees.txt
```

---

Department

```bash
cut -d',' -f3 employees.txt
```

---

Salary

```bash
cut -d',' -f4 employees.txt
```

---

Multiple fields

```bash
cut -d',' -f2,3 employees.txt
```

---

# sort

Sort file content.

---

Ascending

```bash
sort employees.txt
```

---

Descending

```bash
sort -r employees.txt
```

---

Numeric Sort

```bash
sort -n numbers.txt
```

---

Sort by Salary

```bash
sort -t',' -k4 employees.txt
```

---

Reverse Salary Sort

```bash
sort -t',' -k4 -nr employees.txt
```

---

# uniq

Remove duplicate entries.

---

Example

```bash
cat names.txt
```

```text
John
John
Mike
Mike
Alex
```

---

Remove duplicates

```bash
uniq names.txt
```

---

Count duplicates

```bash
uniq -c names.txt
```

---

Common Use

```bash
sort names.txt | uniq
```

---

# wc

Word Count

---

Count lines

```bash
wc -l employees.txt
```

---

Count words

```bash
wc -w employees.txt
```

---

Count characters

```bash
wc -c employees.txt
```

---

Complete statistics

```bash
wc employees.txt
```

---

# tr

Translate characters.

---

Lowercase to Uppercase

```bash
echo "linux" | tr a-z A-Z
```

Output:

```text
LINUX
```

---

Uppercase to Lowercase

```bash
echo "LINUX" | tr A-Z a-z
```

---

Replace Spaces

```bash
echo "Linux DevOps AWS" | tr ' ' ','
```

Output:

```text
Linux,DevOps,AWS
```

---

# tee

Display and save output.

---

```bash
date | tee output.txt
```

---

Append

```bash
date | tee -a output.txt
```

---

# nl

Display line numbers.

```bash
nl employees.txt
```

---

# paste

Merge files.

File1:

```text
John
Mike
Alex
```

File2:

```text
DevOps
AWS
Azure
```

Merge:

```bash
paste names.txt dept.txt
```

---

# split

Split files.

```bash
split -l 100 logfile.log
```

---

Split by size.

```bash
split -b 10M backup.log
```

---

# sed

Stream Editor

Very Important.

Used for:

- Search
- Replace
- Delete
- Update Config Files

---

Display file

```bash
sed '' employees.txt
```

---

Replace text

```bash
sed 's/DevOps/SRE/' employees.txt
```

---

Replace globally

```bash
sed 's/DevOps/SRE/g' employees.txt
```

---

Replace and save

```bash
sed -i 's/DevOps/SRE/g' employees.txt
```

---

Delete specific line

```bash
sed '3d' employees.txt
```

---

Display specific line

```bash
sed -n '2p' employees.txt
```

---

Display range

```bash
sed -n '2,4p' employees.txt
```

---

# awk

Most Important Linux Text Processing Tool

---

Print file

```bash
awk '{print}' employees.txt
```

---

Print entire line

```bash
awk '{print $0}' employees.txt
```

---

Print first column

```bash
awk -F',' '{print $1}' employees.txt
```

---

Print second column

```bash
awk -F',' '{print $2}' employees.txt
```

---

Print Name and Salary

```bash
awk -F',' '{print $2,$4}' employees.txt
```

---

Filter DevOps

```bash
awk -F',' '$3=="DevOps"' employees.txt
```

---

Salary Greater Than 90000

```bash
awk -F',' '$4>90000' employees.txt
```

---

Count Records

```bash
awk 'END {print NR}' employees.txt
```

---

Print Line Numbers

```bash
awk '{print NR,$0}' employees.txt
```

---

Sum Salaries

```bash
awk -F',' '{sum+=$4} END {print sum}' employees.txt
```

---

Average Salary

```bash
awk -F',' '{sum+=$4} END {print sum/NR}' employees.txt
```

---

# Pipes

Pass output from one command to another.

Symbol:

```bash
|
```

---

Example

```bash
cat employees.txt | grep DevOps
```

---

Count DevOps Employees

```bash
cat employees.txt | grep DevOps | wc -l
```

---

Sort Unique Values

```bash
cut -d',' -f3 employees.txt | sort | uniq
```

---

# xargs

Convert input into command arguments.

---

Create files

```bash
echo "a.txt b.txt c.txt" | xargs touch
```

---

Delete files

```bash
find . -name "*.tmp" | xargs rm
```

---

# Real DevOps Examples

## Find Errors

```bash
grep ERROR application.log
```

---

## Count Errors

```bash
grep ERROR application.log | wc -l
```

---

## Top IP Addresses

```bash
awk '{print $1}' access.log | sort | uniq -c | sort -nr
```

---

## Find Failed Logins

```bash
grep "Failed password" /var/log/auth.log
```

---

## Monitor Logs

```bash
tail -f application.log
```

---

## Extract Running Container IDs

```bash
docker ps | awk '{print $1}'
```

---

# Commands to Master Today

```bash
grep
grep -i
grep -v
grep -n
grep -c
grep -r

cut

sort
sort -r
sort -n

uniq
uniq -c

wc
wc -l
wc -w

tr

tee

nl

paste

split

sed
sed -i

awk

xargs

|
```

---

# Interview Questions

### Difference between grep and awk?

### Difference between cut and awk?

### Difference between sed and awk?

### How do you count lines in a file?

```bash
wc -l filename
```

### How do you replace text in a file?

```bash
sed -i 's/old/new/g' file
```

### How do you print second column?

```bash
awk '{print $2}'
```

### How do you find duplicate entries?

```bash
sort file | uniq
```

### How do you search case insensitive?

```bash
grep -i pattern file
```

---

# Lab Exercises

### Create a file

```bash
cat > servers.txt
```

```text
server1,linux,active
server2,windows,active
server3,linux,inactive
server4,linux,active
```

---

Print Linux Servers

```bash
grep linux servers.txt
```

---

Print Active Servers

```bash
grep active servers.txt
```

---

Extract Server Names

```bash
cut -d',' -f1 servers.txt
```

---

Count Servers

```bash
wc -l servers.txt
```

---

Replace active with running

```bash
sed 's/active/running/g' servers.txt
```

---

# Git Commit

```bash
git add Day04/
git commit -m "Day 04 - Text Processing Commands grep sed awk"
```

Or

```bash
git add .
git commit -m "Day 04 Linux text processing and log analysis"
git push origin main
```

---

# Day 04 Outcome

✅ grep

✅ cut

✅ sort

✅ uniq

✅ wc

✅ tr

✅ tee

✅ sed

✅ awk

✅ pipes

✅ xargs

✅ Log Analysis

✅ Text Processing

✅ DevOps Troubleshooting Skills

These commands are heavily used in Jenkins, Docker, Kubernetes, Linux Administration, Monitoring, and Production Support environments.
