# Sed (Stream Editor) - Complete Guide

## What is sed?

`sed` stands for **Stream Editor**.

It is a Linux command-line tool used to:

- Search text
- Replace text
- Insert text
- Delete text
- Modify files automatically

`sed` reads input line by line, applies the given operation, and prints the result.

---

# Basic Syntax

```bash
sed [options] 'command' filename
```

Example:

```bash
sed 's/old/new/' file.txt
```

This replaces the first occurrence of `old` with `new`.

---

# Important Option

## `-i` (In-place Editing)

By default, `sed` only displays the output.

Example:

```bash
sed 's/error/warning/' log.txt
```

Output is displayed on the screen, but the file remains unchanged.

To modify the file directly:

```bash
sed -i 's/error/warning/' log.txt
```

`-i` means:

> Edit the file directly.

---

# Sed Command Structure

General format:

```bash
sed '/pattern/action' file
```

Example:

```bash
sed '/error/d' logfile
```

Meaning:

- Search for lines containing `error`
- Delete those lines

---

# 1. Searching with sed

Example file:

```text
apple
banana
orange
apple juice
```

Command:

```bash
sed -n '/apple/p' file.txt
```

Output:

```text
apple
apple juice
```

Explanation:

- `/apple/` → Search pattern
- `p` → Print matching lines
- `-n` → Suppress default output

---

# 2. Replace Text (`s` Command)

Syntax:

```bash
sed 's/search/replace/' file.txt
```

Example:

```bash
sed 's/apple/mango/' fruits.txt
```

Before:

```text
apple
banana
apple juice
```

After:

```text
mango
banana
mango juice
```

By default, only the first match per line is replaced.

---

# Replace All Occurrences (`g`)

Example:

```bash
sed 's/apple/mango/g' fruits.txt
```

Before:

```text
apple apple
```

After:

```text
mango mango
```

`g` means:

> Global replacement within the line.

---

# 3. Delete Lines (`d`)

Delete lines containing a word:

```bash
sed '/error/d' logfile
```

Before:

```text
INFO Start
ERROR Failed
INFO Complete
```

After:

```text
INFO Start
INFO Complete
```

---

## Delete Specific Line Number

```bash
sed '5d' file.txt
```

Deletes line 5.

---

## Delete a Range of Lines

```bash
sed '5,10d' file.txt
```

Deletes lines 5 through 10.

---

# 4. Insert Lines (`i`)

`i` means:

> Insert text before the matched line.

Example file:

```bash
echo "practice"

if [ -f "$path" ]; then
```

Command:

```bash
sed -i '/if \[ -f/i path="/var/log/dpkg.log"' script.sh
```

Result:

```bash
echo "practice"

path="/var/log/dpkg.log"

if [ -f "$path" ]; then
```

---

# 5. Append Lines (`a`)

`a` means:

> Add text after the matched line.

Example:

```bash
sed -i '/echo "practice"/a path="/var/log/dpkg.log"' script.sh
```

Before:

```bash
echo "practice"
```

After:

```bash
echo "practice"
path="/var/log/dpkg.log"
```

---

# Difference Between `i` and `a`

## Insert (`i`)

Adds text before a line.

Before:

```text
LINE 1
LINE 2
```

Command:

```text
Insert NEW before LINE 2
```

Result:

```text
LINE 1
NEW
LINE 2
```

---

## Append (`a`)

Adds text after a line.

Before:

```text
LINE 1
LINE 2
```

Command:

```text
Append NEW after LINE 2
```

Result:

```text
LINE 1
LINE 2
NEW
```

---

# 6. Print Lines (`p`)

Print line number 5:

```bash
sed -n '5p' file.txt
```

---

Print lines 5 to 10:

```bash
sed -n '5,10p' file.txt
```

---

Print matching lines:

```bash
sed -n '/ERROR/p' logfile
```

---

# 7. Using Line Numbers

Show line numbers:

```bash
nl file.txt
```

Example:

```text
1 apple
2 banana
3 orange
```

Replace line 2:

```bash
sed -i '2s/banana/mango/' file.txt
```

Result:

```text
apple
mango
orange
```

---

# 8. Using Regular Expressions

## Lines Starting With `ERROR`

```bash
sed -n '/^ERROR/p' logfile
```

`^` = Start of line

Example:

```text
ERROR DB connection failed
ERROR User not found
```

---

## Lines Ending With `.log`

```bash
sed -n '/\.log$/p' file.txt
```

`$` = End of line

`.` = Special regex character, so escape it:

```text
\.
```

---

# 9. Escaping Special Characters

Some characters have special meanings in `sed`.

| Character | Escape |
|-----------|---------|
| `[` | `\[` |
| `]` | `\]` |
| `.` | `\.` |
| `/` | `\/` |
| `*` | `\*` |
| `$` | `\$` |

Example:

Wrong:

```bash
sed '/if [/p' script.sh
```

Correct:

```bash
sed '/if \[/p' script.sh
```

---

# 10. Working with File Paths

Since `/` is used as a separator:

Difficult:

```bash
sed 's/\/var\/log/\/tmp\/log/' file.txt
```

Easier:

```bash
sed 's#/var/log#/tmp/log#' file.txt
```

Using `#` makes path replacements much more readable.

---

# 11. Multiple sed Commands

Using `-e`:

```bash
sed -e 's/error/warning/' -e '/debug/d' logfile
```

---

Alternative:

```bash
sed '
s/error/warning/
debug/d
' logfile
```

---

# 12. Backup Before Using `-i`

Create a backup automatically:

```bash
sed -i.bak 's/old/new/' file.txt
```

Creates:

```text
file.txt
file.txt.bak
```

Very useful in production scripts.

---

# 13. Extended Regular Expressions (`-E`)

Enable advanced regex patterns:

```bash
sed -E 's/[0-9]+//g' file.txt
```

Before:

```text
abc123
```

After:

```text
abc
```

---

# 14. Replace Only a Specific Line

Replace on line 3 only:

```bash
sed '3s/error/success/' file.txt
```

---

# 15. Display a Range of Lines

Display lines 10 to 20:

```bash
sed -n '10,20p' logfile
```

Useful for large log analysis.

---

# Useful sed Examples

## Add a Line Before a Pattern

```bash
sed -i '/pattern/i new_line' file.txt
```

---

## Add a Line After a Pattern

```bash
sed -i '/pattern/a new_line' file.txt
```

---

## Replace a Word

```bash
sed -i 's/old/new/g' file.txt
```

---

## Delete Lines Containing Text

```bash
sed -i '/text/d' file.txt
```

---

## Show Only Matching Lines

```bash
sed -n '/text/p' file.txt
```

---

## Delete Blank Lines

```bash
sed '/^$/d' file.txt
```

---

## Remove Leading Spaces

```bash
sed 's/^ *//'
```

---

## Remove Trailing Spaces

```bash
sed 's/ *$//'
```

---

# Real Example: Fix Bash Script

Original:

```bash
echo "practice"

if [ -f "$path" ]; then
```

Insert a variable before the `if` statement:

```bash
sed -i '/if \[ -f/i path="/var/log/dpkg.log"' script.sh
```

Result:

```bash
echo "practice"

path="/var/log/dpkg.log"

if [ -f "$path" ]; then
```

---

# Real DevOps Examples

## Replace Environment Name

```bash
sed -i 's/dev/staging/g' app.conf
```

---

## Comment a Configuration Line

```bash
sed -i 's/^PermitRootLogin/#PermitRootLogin/' sshd_config
```

---

## Extract ERROR Logs

```bash
sed -n '/ERROR/p' app.log
```

---

## Delete DEBUG Logs

```bash
sed '/DEBUG/d' app.log
```

---

## Show Last 20 Log Lines

```bash
sed -n '80,100p' app.log
```

---

# Summary

| Command | Purpose |
|----------|----------|
| `sed` | Stream editor |
| `-i` | Modify file directly |
| `-E` | Extended regular expressions |
| `s` | Substitute |
| `i` | Insert before |
| `a` | Append after |
| `d` | Delete |
| `p` | Print |
| `g` | Replace all matches |
| `/pattern/` | Search pattern |
| `^` | Start of line |
| `$` | End of line |
| `-n` | Suppress default output |

---

# Most Common Production Commands

```bash
sed -i 's/old/new/g' file

sed -i '/pattern/d' file

sed -n '/ERROR/p' logfile

sed -i '/pattern/i new_line' file

sed -i '/pattern/a new_line' file

sed -i.bak 's/old/new/g' file

sed -E 's/[0-9]+//g'
```

Sed is one of the most important Linux text-processing tools and is heavily used in:

- Shell scripting
- Log analysis
- Configuration management
- DevOps automation
- CI/CD pipelines
- Server administration
