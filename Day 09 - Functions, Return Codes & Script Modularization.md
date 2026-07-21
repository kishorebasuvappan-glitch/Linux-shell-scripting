# Day 09 - Functions, Return Codes & Script Modularization

# Learning Objectives

By the end of Day 09, you should be able to:

- Create Functions
- Call Functions
- Pass Arguments to Functions
- Return Values
- Use Exit Codes
- Reuse Code
- Create Modular Scripts
- Implement Error Handling
- Build Real-World DevOps Scripts

---

# What is a Function?

A function is a reusable block of code.

Instead of writing:

```bash
echo "Starting Backup"
echo "Backup Complete"

echo "Starting Backup"
echo "Backup Complete"
```

Multiple times, create a function.

---

# Basic Function Syntax

Method 1

```bash
function_name() {

    commands

}
```

Example:

```bash
hello() {

    echo "Hello DevOps"

}
```

Call function:

```bash
hello
```

Output:

```text
Hello DevOps
```

---

# Alternative Syntax

```bash
function hello {

    echo "Hello DevOps"

}
```

---

# Real Example

```bash
#!/bin/bash

greet() {

    echo "Welcome to Shell Scripting"

}

greet
```

Output:

```text
Welcome to Shell Scripting
```

---

# Multiple Functions

```bash
#!/bin/bash

start_app() {

    echo "Application Started"

}

stop_app() {

    echo "Application Stopped"

}

start_app
stop_app
```

---

# Function Parameters

Functions can receive arguments.

---

Example

```bash
