## Day 02 - File Management Commands

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
echo "Hello
