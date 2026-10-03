# Shell Scripting in Linux — Notes

## 1. Shell and Shell Scripting Basics

### What is a Shell?

A **shell** is a command interpreter that allows users to communicate with the Linux operating system by entering commands.

```text
User
  ↓
Shell
  ↓
Linux Kernel
  ↓
Hardware
```

### What is Bash?

**Bash** stands for **Bourne Again Shell**. It is one of the most commonly used shells for Linux administration and shell scripting.

Common shells:

| Shell | Description |
|---|---|
| `sh` | Bourne Shell |
| `bash` | Bourne Again Shell |
| `zsh` | Z Shell |
| `ksh` | Korn Shell |
| `fish` | Friendly Interactive Shell |

Check the current shell:

```bash
echo "$SHELL"
```

Check Bash version:

```bash
bash --version
```

### Shell vs Terminal

- **Terminal:** Application/interface where commands are entered.
- **Shell:** Program that interprets and executes those commands.

```text
Terminal
   ↓
Bash
   ↓
Linux
```

### What is Shell Scripting?

**Shell scripting** is the process of writing multiple shell commands in a file so they can be executed automatically.

Example:

```bash
#!/bin/bash

mkdir backup
cp file.txt backup/
date
ls backup/
```

Shell scripting combines:

```text
Linux commands + Variables + Conditions + Loops + Automation
```

### Shebang

The first line of a Bash script is commonly:

```bash
#!/bin/bash
```

It tells the operating system to use Bash to execute the script.

### Creating and Executing a Script

Create a file:

```bash
nano hello.sh
```

Script:

```bash
#!/bin/bash

echo "Hello, World!"
```

Run using Bash:

```bash
bash hello.sh
```

Or make it executable:

```bash
chmod +x hello.sh
./hello.sh
```

### Why Shell Scripting is Important

Shell scripts are widely used for:

- Linux administration
- Backup automation
- Server monitoring
- Log processing
- File management
- Software deployment
- DevOps automation
- Docker and cloud automation

---

# 2. Basic Linux Commands in Shell Scripts

A shell script can execute normal Linux commands.

## `echo`

Displays text.

```bash
echo "Hello World"
```

Using a variable:

```bash
name="Radhe"
echo "Hello $name"
```

## `printf`

Provides formatted output.

```bash
printf "Name: %s\n" "$name"
printf "Age: %d\n" "$age"
```

Common format specifiers:

| Format | Meaning |
|---|---|
| `%s` | String |
| `%d` | Integer |
| `\n` | New line |

## `pwd`

Displays the current working directory.

```bash
pwd
```

## `ls`

Lists files and directories.

```bash
ls
ls -l
ls -a
ls -lh
```

## `cd`

Changes the current directory.

```bash
cd /tmp
```

## `mkdir`

Creates a directory.

```bash
mkdir backup
```

Create nested directories:

```bash
mkdir -p project/src/components
```

## `touch`

Creates an empty file or updates its timestamp.

```bash
touch data.txt
```

## `cp`

Copies files or directories.

```bash
cp file.txt backup/
```

## `mv`

Moves or renames files.

Rename:

```bash
mv old.txt new.txt
```

Move:

```bash
mv data.txt backup/
```

## `rm`

Removes files.

```bash
rm test.txt
```

Remove a directory recursively:

```bash
rm -r directory
```

> Be careful with `rm`, especially `rm -rf`, because it can permanently delete data.

## `cat`

Displays file contents.

```bash
cat data.txt
```

## `head`

Displays the beginning of a file.

```bash
head data.txt
head -5 data.txt
```

## `tail`

Displays the end of a file.

```bash
tail data.txt
tail -5 data.txt
```

Follow a log file:

```bash
tail -f application.log
```

## `grep`

Searches for text or patterns.

```bash
grep "ERROR" application.log
```

Case-insensitive search:

```bash
grep -i "error" application.log
```

## `wc`

Counts lines, words, and characters.

```bash
wc data.txt
```

Useful options:

```bash
wc -l data.txt   # Lines
wc -w data.txt   # Words
wc -c data.txt   # Bytes/characters in common text cases
```

## `sort`

Sorts lines.

```bash
sort names.txt
```

Reverse order:

```bash
sort -r names.txt
```

## `cut`

Extracts fields from text.

Example:

```text
101,Rahul,CSE
102,Amit,IT
103,Radhe,CSE
```

Extract first field:

```bash
cut -d ',' -f 1 students.txt
```

Extract second field:

```bash
cut -d ',' -f 2 students.txt
```

- `-d ','` → comma is the delimiter
- `-f 1` → select field 1

## `tr`

Translates or replaces characters.

Convert lowercase to uppercase:

```bash
echo "hello" | tr 'a-z' 'A-Z'
```

Replace spaces with underscores:

```bash
echo "Linux Shell Scripting" | tr ' ' '_'
```

## Pipe `|`

A pipe sends the output of one command to another command as input.

```bash
command1 | command2
```

Example:

```bash
ls | grep ".txt"
```

Another example:

```bash
cat students.txt | grep "CSE" | sort
```

---

# 3. Variables in Shell Scripting

## What is a Variable?

A variable is a named place used to store a value.

```bash
name="Radhe"
```

Here:

- `name` → variable name
- `Radhe` → value

Access the variable using `$`:

```bash
echo "$name"
```

## Creating Variables

```bash
name="Radhe"
age=26
city="Pune"
```

### Important Rule

There must be **no spaces around `=`**.

Correct:

```bash
name="Radhe"
```

Incorrect:

```bash
name = "Radhe"
```

## Using Variables

```bash
name="Radhe"
echo "$name"
```

Example:

```bash
name="Rahul"
age=22
course="MCA"

echo "Name: $name"
echo "Age: $age"
echo "Course: $course"
```

## Variable Naming Rules

Variable names can contain:

- Letters
- Numbers
- Underscores

A variable must not start with a number.

Correct:

```bash
name="Radhe"
user_name="Radhe"
user1="Radhe"
```

Incorrect:

```bash
1user="Radhe"
```

Variables are case-sensitive:

```bash
name="Radhe"
Name="Rahul"
NAME="Amit"
```

These are three different variables.

## Quotes

Double quotes allow variable expansion:

```bash
name="Radhe"

echo "Hello $name"
```

Output:

```text
Hello Radhe
```

Single quotes prevent variable expansion:

```bash
echo 'Hello $name'
```

Output:

```text
Hello $name
```

For shell scripting, prefer quoting variable expansions:

```bash
echo "$name"
```

This is especially important when values contain spaces or special characters.

## Environment Variables

Linux provides predefined environment variables.

Examples:

```bash
echo "$USER"
echo "$HOME"
echo "$SHELL"
echo "$PWD"
echo "$PATH"
```

Common variables:

| Variable | Meaning |
|---|---|
| `$USER` | Current username |
| `$HOME` | User's home directory |
| `$SHELL` | Current/default shell |
| `$PWD` | Current working directory |
| `$PATH` | Directories searched for commands |

## `export`

`export` makes a variable available to child processes.

```bash
export APP_ENV="production"
```

A child shell can inherit it:

```bash
bash
echo "$APP_ENV"
```

## `readonly`

Makes a variable read-only.

```bash
readonly VERSION="1.0"
```

Trying to change it later produces an error.

## `unset`

Removes a variable.

```bash
name="Radhe"
unset name
```

## Command Substitution

Command substitution stores the output of a command in a variable.

Syntax:

```bash
$(command)
```

Example:

```bash
current_user=$(whoami)
current_date=$(date)
current_dir=$(pwd)
```

Use:

```bash
echo "$current_user"
echo "$current_date"
echo "$current_dir"
```

## Arithmetic with Variables

Use `$(( ))` for integer arithmetic.

```bash
a=10
b=20

sum=$((a + b))

echo "$sum"
```

Operations:

```bash
sum=$((a + b))
difference=$((a - b))
product=$((a * b))
division=$((a / b))
remainder=$((a % b))
```

> Normal Bash arithmetic is integer-based. Decimal calculations generally require tools such as `bc` or `awk`.

## Important Special Variables

| Variable | Meaning |
|---|---|
| `$0` | Script name |
| `$1` | First command-line argument |
| `$2` | Second command-line argument |
| `$#` | Number of command-line arguments |
| `$@` | All command-line arguments |
| `$?` | Exit status of previous command |
| `$$` | PID of current shell |

Command-line arguments and exit status will be covered in detail later.

---

# 4. User Input with `read`

## What is `read`?

`read` takes input from the user through the keyboard and stores it in a variable.

Basic syntax:

```bash
read variable
```

Example:

```bash
#!/bin/bash

echo "Enter your name:"
read name

echo "Hello $name"
```

## `read -p`

`-p` displays a prompt while taking input.

```bash
read -p "Enter your name: " name
```

Example:

```bash
#!/bin/bash

read -p "Enter your name: " name

echo "Hello $name"
```

## Reading Multiple Values

```bash
read -p "Enter your name and age: " name age
```

Input:

```text
Radhe 26
```

Then:

```bash
echo "$name"
echo "$age"
```

## Reading Input Containing Spaces

For one variable, a line containing spaces can be stored as a whole:

```bash
read -r -p "Enter your full name: " name
```

Input:

```text
Radhe Kumar
```

The value of `name` becomes:

```text
Radhe Kumar
```

## Reading Passwords

Use `-s` to hide input:

```bash
read -s -p "Enter password: " password
echo
```

- `-s` → silent input
- `echo` → moves to the next line after hidden input

## `read -r`

`-r` prevents Bash from treating backslashes as escape characters.

Recommended for reading normal text:

```bash
read -r -p "Enter name: " name
```

## Reading an Array

Use `-a`:

```bash
read -a numbers
```

If the user enters:

```text
10 20 30 40 50
```

the values are stored as:

```text
numbers[0] = 10
numbers[1] = 20
numbers[2] = 30
numbers[3] = 40
numbers[4] = 50
```

## `read -t`

Sets a timeout for input.

```bash
read -t 5 -p "Enter your name: " name
```

The script waits for up to 5 seconds.

## Input Validation

If the user presses Enter without entering anything, the variable may be empty.

Example:

```bash
#!/bin/bash

read -r -p "Enter your name: " name

if [ -z "$name" ]; then
    echo "Name cannot be empty."
else
    echo "Hello $name"
fi
```

Here:

```bash
-z "$name"
```

checks whether the string is empty.

Conditional statements will be covered in detail later.

---

# 5. Complete Example: Interactive Student Information Script

```bash
#!/bin/bash

read -r -p "Enter your name: " name
read -r -p "Enter your age: " age
read -r -p "Enter your course: " course
read -r -p "Enter your college: " college
read -r -p "Enter your city: " city

echo
echo "===== STUDENT INFORMATION ====="
echo "Name    : $name"
echo "Age     : $age"
echo "Course  : $course"
echo "College : $college"
echo "City    : $city"
```

This demonstrates:

- Shebang
- `read`
- Variables
- User input
- `echo`
- Quoting variables

---

# 6. Practical Example: System Information Script

```bash
#!/bin/bash

username=$(whoami)
hostname=$(hostname)
current_dir=$(pwd)
current_date=$(date)

echo "===== SYSTEM INFORMATION ====="
echo "User       : $username"
echo "Hostname   : $hostname"
echo "Directory  : $current_dir"
echo "Date       : $current_date"

echo
echo "Disk Usage:"
df -h

echo
echo "Memory Usage:"
free -h
```

This demonstrates how shell commands, variables, and command substitution can be combined into a useful automation script.

---

# 7. Key Concepts Covered So Far

```text
Shell
  ↓
Bash
  ↓
Shell Script
  ↓
Linux Commands
  ↓
Variables
  ↓
Command Substitution
  ↓
User Input
  ↓
Automation
```

The next topic is **Operators**, which will introduce arithmetic, comparison, string, and logical operations needed to make decisions in shell scripts.
