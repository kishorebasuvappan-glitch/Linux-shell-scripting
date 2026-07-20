# AWK - Complete Guide

## What is AWK?

`awk` is a powerful Linux command-line tool used for:

- Processing text files
- Searching patterns
- Extracting columns
- Formatting output
- Performing calculations
- Generating reports

AWK works especially well with structured text files like:

- CSV files
- Log files
- `/etc/passwd`
- System reports

AWK reads a file **line by line**, splits each line into fields (columns), and performs actions on those fields.

---

# Basic Syntax

```bash
awk 'pattern { action }' file
```

Example:

```bash
awk '{print $1}' file.txt
```

Meaning:

- Read each line
- Take the first column
- Print it

---

# How AWK Works

Example file:

```text
John 25 Chennai
David 30 Mumbai
Alex 28 Delhi
```

Command:

```bash
awk '{print $1}' file.txt
```

Output:

```text
John
David
Alex
```

AWK automatically separates data into fields.

---

# AWK Fields

AWK stores columns in variables:

- `$0` → Entire line
- `$1` → First column
- `$2` → Second column
- `$3` → Third column
- `$NF` → Last column
- `NF` → Number of columns
- `NR` → Current line number

---

## Example

File:

```text
apple 100 red
banana 200 yellow
orange 300 orange
```

Command:

```bash
awk '{print $0}' file.txt
```

Output:

```text
apple 100 red
banana 200 yellow
orange 300 orange
```

`$0` prints the complete line.

---

Command:

```bash
awk '{print $1}' file.txt
```

Output:

```text
apple
banana
orange
```

---

Command:

```bash
awk '{print $2}' file.txt
```

Output:

```text
100
200
300
```

---

# What is `-F` in AWK?

`-F` means:

> Field Separator

By default, AWK separates columns using spaces or tabs.

If your file uses another separator, use `-F`.

Syntax:

```bash
awk -F 'separator' '{action}' file
```

---

# Example: CSV File

File:

```text
Name,Age,City
John,25,Chennai
David,30,Mumbai
```

Without `-F`:

```bash
awk '{print $1}' file.csv
```

Output:

```text
Name,Age,City
John,25,Chennai
David,30,Mumbai
```

AWK sees the entire line as one column.

---

With `-F ","`:

```bash
awk -F "," '{print $1}' file.csv
```

Output:

```text
Name
John
David
```

Now AWK understands that commas separate fields.

---

# Common Field Separators

## Space Separator

Default:

```bash
awk '{print $1}' file
```

---

## CSV Separator

```bash
awk -F "," '{print $1}' file.csv
```

---

## Colon Separator

Example `/etc/passwd`:

```text
root:x:0:0:root:/root:/bin/bash
```

Command:

```bash
awk -F ":" '{print $1}' /etc/passwd
```

Output:

```text
root
```

---

## Pipe Separator

File:

```text
name|age|city
John|25|Chennai
```

Command:

```bash
awk -F "|" '{print $1}' file
```

Output:

```text
name
John
```

---

## Tab Separator

```bash
awk -F '\t' '{print $1}' file.tsv
```

---

# Printing Multiple Columns

Example:

```bash
awk -F "," '{print $1,$3}' file.csv
```

Output:

```text
John Chennai
David Mumbai
```

---

# Adding Custom Output

Example:

```bash
awk -F "," '{print "Name:",$1,"City:",$3}' file.csv
```

Output:

```text
Name: John City: Chennai
Name: David City: Mumbai
```

---

# BEGIN Block

`BEGIN` runs before reading the file.

Example:

```bash
awk 'BEGIN {print "Employee Report"} {print $1}' file.txt
```

Output:

```text
Employee Report
John
David
Alex
```

---

# END Block

`END` runs after processing the file.

Example:

```bash
awk 'END {print "Completed"}' file.txt
```

Output:

```text
Completed
```

---

# BEGIN + Processing + END

Structure:

```bash
awk '
BEGIN {
    commands
}
{
    commands
}
END {
    commands
}
' file
```

Example:

```bash
awk '
BEGIN {
    print "Name"
}
{
    print $1
}
END {
    print "Done"
}
' file.txt
```

Output:

```text
Name
John
David
Alex
Done
```

---

# Formatting Output with printf

`print` gives simple output.

`printf` gives formatted output.

Example:

```bash
awk -F "," '
BEGIN {
    printf "%-15s %-10s %-15s\n","NAME","AGE","CITY"
}
{
    printf "%-15s %-10s %-15s\n",$1,$2,$3
}
' file.csv
```

Output:

```text
NAME            AGE        CITY
John            25         Chennai
David           30         Mumbai
```

---

# Difference Between print and printf

## print

```bash
awk '{print $1,$2}' file.txt
```

Output:

```text
John 25
David 30
```

AWK automatically adds spaces and a newline.

---

## printf

```bash
awk '{printf "%s %s\n",$1,$2}' file.txt
```

Output:

```text
John 25
David 30
```

You control formatting completely.

---

# NR - Line Number

Example:

```bash
awk '{print NR,$1}' file.txt
```

Output:

```text
1 John
2 David
3 Alex
```

---

# NF - Number of Fields

Example:

```bash
awk '{print NF}' file.txt
```

Output:

```text
3
3
3
```

Print the last column:

```bash
awk '{print $NF}' file.txt
```

---

# Variables in AWK

Pass shell variables into AWK:

```bash
awk -v name="Kishore" 'BEGIN {print name}'
```

Output:

```text
Kishore
```

---

Example:

```bash
awk -F "," -v prefix="ID:" '{print prefix,$1}' file.csv
```

---

# Conditions in AWK

Syntax:

```bash
awk 'condition {action}' file
```

Example:

```bash
awk '$2 > 25 {print $1}' file.txt
```

Output:

```text
David
Alex
```

---

# Multiple Conditions

Example:

```bash
awk '$2 > 20 && $3 == "Chennai" {print $1}' file.txt
```

---

Using OR:

```bash
awk '$3=="Chennai" || $3=="Delhi" {print $1}' file.txt
```

---

# Search Text

Example:

```bash
awk '/error/ {print}' logfile
```

Prints lines containing:

```text
error
```

---

Case-insensitive search:

```bash
awk 'tolower($0) ~ /error/' logfile
```

---

# Mathematical Operations

File:

```text
John 100
David 200
Alex 300
```

Calculate total:

```bash
awk '{sum += $2} END {print sum}' file.txt
```

Output:

```text
600
```

---

Calculate average:

```bash
awk '{sum += $2} END {print sum/NR}' file.txt
```

Output:

```text
200
```

---

Find maximum value:

```bash
awk 'max<$2 {max=$2} END {print max}' file.txt
```

Output:

```text
300
```

---

# Working With Logs

Show package names from CSV:

```bash
awk -F "," '{print $1}' updates.csv
```

---

Show first and third columns:

```bash
awk -F "," '{print $1,$3}' updates.csv
```

---

Show lines containing ERROR:

```bash
awk '/ERROR/ {print}' application.log
```

---

Count ERROR entries:

```bash
awk '/ERROR/ {count++} END {print count}' application.log
```

---

# AWK Command Examples

## Print Column 2

```bash
awk '{print $2}' file.txt
```

---

## Print CSV Column 3

```bash
awk -F "," '{print $3}' file.csv
```

---

## Add Header

```bash
awk '
BEGIN {
    print "NAME AGE CITY"
}
{
    print $1,$2,$3
}
' file.txt
```

---

## Count Lines

```bash
awk 'END {print NR}' file.txt
```

---

## Print Last Column

```bash
awk '{print $NF}' file.txt
```

---

## Print First and Last Columns

```bash
awk '{print $1,$NF}' file.txt
```

---

## Display Only Specific Record

```bash
awk 'NR==5' file.txt
```

Prints line number 5.

---

## Display Range of Records

```bash
awk 'NR>=5 && NR<=10' file.txt
```

---

# Real DevOps Examples

## Extract Usernames From `/etc/passwd`

```bash
awk -F ":" '{print $1}' /etc/passwd
```

---

## Show Running Processes and Memory

```bash
ps -ef | awk '{print $1,$2,$8}'
```

---

## Find High CPU Processes

```bash
ps aux | awk '$3 > 50 {print $2,$3,$11}'
```

---

## Count Logged-In Users

```bash
who | awk '{print $1}' | sort | uniq | wc -l
```

---

## Sum Disk Usage Report

```bash
du -sk * | awk '{sum += $1} END {print sum}'
```

---

## Parse CSV Patch Report

```bash
awk -F "," '{print $1,$2,$3}' updates.csv
```

---

# AWK vs CUT

## cut

```bash
cut -d "," -f1 file.csv
```

Good for simple column extraction.

---

## awk

```bash
awk -F "," '{print $1}' file.csv
```

Good for:

- Calculations
- Conditions
- Formatting
- Reports

---

# Summary

- `awk` → Process text
- `$0` → Full line
- `$1,$2,$3` → Columns
- `$NF` → Last column
- `NF` → Number of fields
- `NR` → Line number
- `-F` → Field separator
- `BEGIN` → Before processing
- `END` → After processing
- `print` → Simple output
- `printf` → Formatted output
- `-v` → Pass shell variable into AWK

---

# Most Common Production Commands

```bash
awk '{print $1}' file

awk -F "," '{print $1}' file.csv

awk -F ":" '{print $1}' /etc/passwd

awk '{print NR,$0}' file

awk '{print $NF}' file

awk '$2 > 100 {print $1}' file

awk '{sum += $2} END {print sum}' file

awk 'END {print NR}' file

awk -v var="ID:" '{print var,$1}' file

awk '/ERROR/ {print}' logfile
```

AWK is one of the most powerful Linux text-processing tools and is heavily used for:

- Linux Administration
- DevOps Automation
- Log Analysis
- CSV Processing
- Report Generation
- Monitoring Scripts
- Security Auditing
