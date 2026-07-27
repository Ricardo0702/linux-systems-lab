# Project 02 — Users, Groups and Permissions

## Overview

Linux is fundamentally a multi-user operating system. Every action performed on the system is executed on behalf of a specific user and is governed by a well-defined permission model.

This project focuses on understanding how Linux represents user identities, how ownership and permissions are applied to files and directories, and how privilege escalation is performed securely using sudo.

Rather than memorizing administrative commands, the objective was to understand the security model that allows multiple users and services to coexist safely on the same system.

## Learning Objectives

By the end of this project I was able to:

- Understand how Linux identifies users and groups internally.
- Interpret the structure of `/etc/passwd`.
- Distinguish between human users and system users.
- Create and manage local user accounts.
- Understand file ownership and permission models.
- Interpret symbolic and numeric permissions.
- Apply ownership and permission changes safely.
- Understand the purpose and correct use of `sudo`.

## Concepts Covered

- User identities (UID)
- Group identities (GID)
- Local user database
- Human and system accounts
- Home directories
- File ownership
- Permission model
- Symbolic permissions
- Numeric permissions
- Privilege escalation
- Principle of Least Privilege

## Practical Exploration

A complete user management workflow was reproduced in a controlled laboratory environment. A new local user was created, inspected and validated to understand how Linux stores user identities and home directories.

Different ownership and permission scenarios were explored using dedicated laboratory files and directories. Symbolic and numeric permissions were applied with `chmod`, ownership was modified using `chown`, and privilege escalation was analysed through both `sudo` and `su` in realistic administration scenarios.

## Key Takeaways

- Linux identifies users internally using UIDs and GIDs rather than user names.
- File access is determined by ownership, group membership and permission bits.
- File ownership and permissions are independent concepts that work together to enforce security.
- `sudo` provides temporary privilege escalation while allowing users to operate as unprivileged accounts by default.
- The Principle of Least Privilege is one of the foundations of secure Linux system administration.

## Project Resolution Summary

| Field | Value |
|-------|-------|
| Difficulty | Beginner |
| Estimated Time | ~10 hours |
| Environment | Ubuntu Server 26.04 LTS |
| Tools | Bash, SSH, VSCode |