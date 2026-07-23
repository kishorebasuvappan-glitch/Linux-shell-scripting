# Bash `mapfile -t files` Explanation

`mapfile -t files` is a Bash command that reads lines of input into an **array**.

Let's break it down:

```bash
mapfile -t files < <(find . -type f -name "Day*" -mtime -5)
```

---

## 1. `mapfile`

`mapfile` (also called `readarray`) reads input line by line and stores each line as an array element.

Example:

```bash
mapfile names <<EOF
John
David
Alex
EOF
```

Creates an array:

```bash
names[0]="John"
names[1]="David"
names[2]="Alex"
```

---

## 2. `-t`

The `-t` option removes the **newline character** (`\n`) from each line.

### Without `-t`

```bash
mapfile files < filelist.txt
```

The stored values contain the newline:

```text
"Day1.txt\n"
"Day2.txt\n"
```

### With `-t`

```bash
mapfile -t files < filelist.txt
```

The newline is removed:

```text
"Day1.txt"
"Day2.txt"
```

---

## 3. `files`

`files` is the name of the array being created.

Example:

```bash
echo "${files[0]}"
```

Prints the first file.

```bash
echo "${files[1]}"
```

Prints the second file.

---

## 4. `< <(command)` (Process Substitution)

This part:

```bash
< <(find . -type f -name "Day*" -mtime -5)
```

means:

1. Run the `find` command.
2. Send its output as input to `mapfile`.

If `find` returns:

```text
./Day 08 - Loops in Shell Scripting.md
./Day09.md
./Day10.md
```

`mapfile` creates:

```bash
files[0]="./Day 08 - Loops in Shell Scripting.md"
files[1]="./Day09.md"
files[2]="./Day10.md"
```

---

## Using `mapfile` with a `for` loop

```bash
for file in "${files[@]}"
do
    echo "$file"
done
```

Output:

```text
./Day 08 - Loops in Shell Scripting.md
./Day09.md
./Day10.md
```

---

## Why use `"${files[@]}"`?

The quotes preserve filenames containing spaces.

Without quotes:

```bash
for file in ${files[@]}
```

A filename like:

```text
./Day 08 - Loops in Shell Scripting.md
```

would be split into multiple words:

```text
./Day
08
-
Loops
in
Shell
Scripting.md
```

With quotes:

```bash
for file in "${files[@]}"
```

The complete filename is treated as one item.

---

## Complete Example

```bash
#!/bin/bash

mapfile -t files < <(find . -type f -name "Day*" -mtime -5)

i=1

for file in "${files[@]}"
do
    echo "File $i: $file"
    i=$((i + 1))
done
```

Example output:

```text
File 1: ./Day 08 - Loops in Shell Scripting.md
File 2: ./Day09.md
File 3: ./Day10.md
```