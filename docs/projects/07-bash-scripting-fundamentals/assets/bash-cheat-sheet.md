# Bash Cheat Sheet

A quick reference for the Bash concepts and syntax used throughout the Linux Systems Lab.

> This document is intended as a practical reference, not a complete Bash manual.

---

# Variables

## Create a variable

```bash
USERNAME="ricardo"
PORT=22
```

## Access a variable

```bash
echo "$USERNAME"
```

---

# Environment Variables

Display common environment variables:

```bash
echo "$HOME"
echo "$USER"
echo "$PWD"
echo "$PATH"
echo "$SHELL"
```

Useful examples:

| Variable | Description                           |
| -------- | ------------------------------------- |
| `$HOME`  | User home directory                   |
| `$USER`  | Current username from the environment |
| `$PWD`   | Current working directory             |
| `$PATH`  | Executable search path                |
| `$SHELL` | Current shell                         |

---

# Command Substitution

Store the output of a command:

```bash
HOSTNAME=$(hostname)
DATE=$(date)
```

Inline usage:

```bash
echo "Hostname: $(hostname)"
```

---

# Parameter Expansion

Remove a trailing `%` character:

```bash
USAGE="51%"
NUMBER=${USAGE%\%}
```

Result:

```text
51
```

---

# Script Arguments

Access positional arguments:

```bash
echo "$1"
echo "$2"
```

Example:

```bash
./script.sh 80
```

Inside the script:

```text
$1 → 80
```

Special parameters:

| Parameter       | Description                    |
| --------------- | ------------------------------ |
| `$0`            | Script name or invocation path |
| `$#`            | Number of arguments received   |
| `$@`            | All arguments received         |
| `$1`, `$2`, ... | Positional arguments           |

Example:

```bash
echo "Usage: $0 [threshold]"
```

---

# If Statements

Basic syntax:

```bash
if [ "$USER" = "root" ]
then
    echo "Administrator"
else
    echo "Standard User"
fi
```

Numeric comparison:

```bash
if [ "$USAGE" -gt 90 ]
then
    echo "Warning"
fi
```

Common operators:

| Operator | Meaning               |
| -------- | --------------------- |
| `=`      | Equal (strings)       |
| `!=`     | Different (strings)   |
| `-eq`    | Equal                 |
| `-ne`    | Not equal             |
| `-gt`    | Greater than          |
| `-lt`    | Less than             |
| `-ge`    | Greater than or equal |
| `-le`    | Less than or equal    |

Logical AND:

```bash
if [ "$VALUE" -ge 0 ] && [ "$VALUE" -le 100 ]
then
    echo "Valid range."
fi
```

---

# Input Validation

Check whether an argument is empty:

```bash
if [ -z "$1" ]
then
    echo "No argument provided."
fi
```

Validate an integer using a regular expression:

```bash
if [[ "$1" =~ ^[0-9]+$ ]]
then
    echo "Valid integer."
fi
```

Regular expression:

```text
^[0-9]+$
```

Meaning:

* `^` → Start of string
* `[0-9]` → Any digit
* `+` → One or more occurrences
* `$` → End of string

Validate a numeric range:

```bash
if [ "$1" -ge 0 ] && [ "$1" -le 100 ]
then
    echo "Value is within range."
fi
```

---

# Exit Codes

Display the exit code of the last command:

```bash
echo $?
```

Convention:

| Exit Code | Meaning                              |
| --------: | ------------------------------------ |
|       `0` | Success                              |
|  Non-zero | Error or other non-success condition |

Terminate a script successfully:

```bash
exit 0
```

Terminate because of an error:

```bash
exit 1
```

Use a command directly as an `if` condition:

```bash
if mkdir test
then
    echo "Directory created."
else
    echo "Operation failed."
fi
```

---

# Pipes

Send the standard output of one command to the standard input of another:

```bash
command1 | command2
```

Example:

```bash
findmnt -no TARGET,SOURCE,FSTYPE,USE% / | awk '{print $4}'
```

---

# awk

Print a specific field from structured text:

```bash
awk '{print $1}'
```

Examples:

```bash
awk '{print $2}'
awk '{print $4}'
```

Inside AWK:

```text
$1 → First field

$2 → Second field

$3 → Third field

...
```

---

# Functions

Declare a function:

```bash
print_header() {

    echo "Linux Systems Lab"

}
```

Call a function:

```bash
print_header
```

---

# Functions with Arguments

Functions can receive positional arguments:

```bash
print_status() {

    echo "$1: $2"

}
```

Call the function:

```bash
print_status "Storage" "OK"
```

Inside the function:

```text
$1 → Storage

$2 → OK
```

---

# Redirections

Redirect standard output to a file:

```bash
command > file.txt
```

Overwrite the file if it already exists.

Append instead:

```bash
command >> file.txt
```

Redirect standard error:

```bash
command 2> error.txt
```

Standard file descriptors:

| Descriptor | Stream |
| ---------: | ------ |
|        `0` | stdin  |
|        `1` | stdout |
|        `2` | stderr |

---

# /dev/null

Discard standard output:

```bash
command > /dev/null
```

Discard standard error:

```bash
command 2> /dev/null
```

Discard both streams independently:

```bash
command > /dev/null 2> /dev/null
```

Useful when only the command exit status matters:

```bash
if systemctl is-active ssh > /dev/null
then
    echo "SSH is running."
fi
```

---

# Executable Scripts

Typical Bash shebang:

```bash
#!/usr/bin/bash
```

Add execution permission:

```bash
chmod +x script.sh
```

Execute using a relative path:

```bash
./script.sh
```

Display the executable search path:

```bash
echo "$PATH"
```

Locate an executable:

```bash
which bash
which ls
```

---

# Useful Commands

## Current user

```bash
whoami
```

## Hostname

```bash
hostname
```

## Current directory

```bash
pwd
```

## Current date

```bash
date
```

## Mounted filesystems

```bash
findmnt
```

## Root filesystem

```bash
findmnt /
```

## Root filesystem usage

```bash
findmnt -no TARGET,SOURCE,FSTYPE,USE% /
```

## Block devices

```bash
lsblk
```

## Filesystems

```bash
lsblk -f
```

## Disk usage

```bash
df -h
```

---

# Best Practices

* Use descriptive variable names.
* Use environment variables only when they accurately represent the information required.
* Prefer functions over duplicated code.
* Check command success using exit codes.
* Validate user input before using it.
* Keep configuration separate from execution logic.
* Build scripts from small reusable components.
* Keep the main program short and readable.
* Avoid adding functionality that does not solve a real problem.
