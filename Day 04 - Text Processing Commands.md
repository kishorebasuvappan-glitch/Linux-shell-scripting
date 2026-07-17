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
grep "root" /etc/
