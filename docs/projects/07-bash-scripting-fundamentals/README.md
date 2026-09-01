# Project 07 — Bash Scripting Fundamentals

## Overview

This project introduces Bash scripting as a practical tool for Linux systems administration.

Rather than learning Bash syntax in isolation, the project follows the incremental development of a real system information utility. New language features are introduced only when required by the implementation itself, closely reflecting how Bash is used in real-world administration tasks.

Starting from a minimal executable script, the project progressively evolves into a reusable command-line utility capable of collecting system information, validating user input, generating structured reports, and following common Unix scripting conventions.

The project also includes a reusable Bash Cheat Sheet that serves as a quick reference for the language features and Linux utilities introduced throughout the implementation.

---

## Project Artifacts

This project includes the following implementation and supporting documentation:

| Artifact | Description |
|----------|-------------|
| [`scripts/system-info.sh`](scripts/system-info.sh) | Bash utility developed throughout the project to generate a structured system information report. |
| [`assets/bash-cheat-sheet.md`](assets/bash-cheat-sheet.md) | Concise reference covering the Bash syntax, commands and scripting concepts introduced during the project. |

---

## Learning Objectives

* Understand the role of Bash within Linux systems administration.
* Learn how executable scripts interact with the operating system.
* Develop reusable Bash scripts using functions and modular design.
* Understand environment variables and command substitution.
* Learn how Bash integrates with common Linux command-line utilities.
* Validate user input and implement basic error handling.
* Apply common Unix scripting conventions and best practices.

---

## Concepts Covered

* Bash
* Shebang
* Executable permissions
* PATH
* Variables
* Environment variables
* Command substitution
* Parameter expansion
* Positional arguments
* Special parameters (`$0`, `$#`, `$@`)
* Conditional statements
* String and numeric comparisons
* Regular expressions
* Input validation
* Exit codes
* Functions
* Functions with arguments
* Pipes
* `awk`
* Output redirection
* Standard streams (`stdin`, `stdout`, `stderr`)
* `/dev/null`
* Unix scripting conventions

---

## Practical Exploration

The project follows the complete development lifecycle of a reusable Bash utility instead of introducing language features independently.

### 1. Creating the first executable Bash script

A minimal executable Bash script was created to understand the purpose of the shebang, execution permissions and how Linux locates executable files through the system `PATH`.

### 2. Working with variables

System information was collected using environment variables and command substitution.

The project explored how Bash stores and expands variables while interacting with Linux commands.

### 3. Organizing the script

Functions were introduced to separate responsibilities and improve readability.

The script was progressively reorganized into a clear structure composed of configuration, reusable functions and a main execution flow.

### 4. Building a system information utility

The script evolved into a reusable command-line tool capable of displaying:

* current user;
* hostname;
* current working directory;
* current date;
* root filesystem usage;
* storage health status.

Information was gathered using standard Linux utilities including `findmnt`, pipes and `awk`.

### 5. Implementing user input validation

Command-line arguments were introduced to configure the storage warning threshold.

The project explored:

* positional arguments;
* regular expressions;
* numeric validation;
* exit codes;
* built-in help documentation.

The script rejects invalid input while providing meaningful error messages.

### 6. Exploring Bash scripting fundamentals

Several core Bash concepts were incorporated naturally throughout the implementation, including:

* conditional statements;
* parameter expansion;
* functions with arguments;
* output redirection;
* standard streams;
* `/dev/null`;
* Unix command-line conventions.

### 7. Creating supporting documentation

A dedicated **Bash Cheat Sheet** was produced to summarize the syntax, commands and scripting concepts introduced during the project, providing a concise reference for future projects.

---

## Key Takeaways

* Bash is a powerful automation tool for Linux systems administration.
* Well-structured scripts prioritize readability and maintainability over unnecessary complexity.
* Input validation is essential for building reliable command-line utilities.
* Unix philosophy encourages combining small tools through standard streams and reusable commands.
* Functions improve organization, modularity and code reuse.
* Bash becomes significantly more powerful when integrated with existing Linux utilities.
* Practical scripting skills are best developed by solving real administration tasks rather than isolated language exercises.

---

## Project Resolution Summary

| Field                    | Value                                                                                                |
| ------------------------ | ---------------------------------------------------------------------------------------------------- |
| Environment              | Ubuntu Server 26.04 LTS ARM                                                                          |
| Platform                 | VMware Fusion on Apple Silicon                                                                       |
| Main Language            | Bash                                                                                                 |
| Additional Documentation | Bash Cheat Sheet, System Information Script                                                                                    |
| Skills Demonstrated      | Bash Scripting, Unix Philosophy, Linux Command-Line Tools, Input Validation, Automation Fundamentals |
