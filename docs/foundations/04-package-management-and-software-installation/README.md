# Project 04 — Package Management and Software Installation

## Overview

Modern Linux distributions provide a centralized and secure software distribution model through package managers and official repositories.

This project focuses on understanding how software is distributed, installed, updated and removed in Ubuntu systems using `apt`. Rather than memorizing package management commands, the objective was to understand the complete software lifecycle, from repositories to installation and maintenance.

By the end of this project, package management became a predictable and structured process instead of a collection of isolated commands.

## Learning Objectives

By the end of this project I was able to:

- Understand what a software package is.
- Understand the role of package repositories.
- Distinguish between package managers and repositories.
- Understand package dependencies.
- Search and inspect packages before installation.
- Install and remove software safely.
- Distinguish between `apt update` and `apt upgrade`.
- Inspect installed packages and their files.
- Understand Ubuntu's Long-Term Support (LTS) package philosophy.

## Concepts Covered

- Software packages
- Package repositories
- APT
- DPKG
- Package metadata
- Package dependencies
- Software installation
- Package removal
- Repository configuration
- Package inspection
- System updates
- Ubuntu LTS philosophy

## Practical Exploration

This project explored the complete software distribution workflow in Ubuntu.

Official repositories were inspected, package metadata was analysed, and software was searched, installed and managed using `apt`. Package information was also inspected using `dpkg`, allowing a better understanding of how Linux keeps track of installed software and its associated files.

Different update strategies were explored to understand the distinction between updating package information and updating installed software, reinforcing a structured workflow for package management.

## Key Takeaways

- Software in Linux is distributed through packages stored in repositories.
- `apt` provides a high-level interface for package management.
- Packages contain much more than executables, including metadata and dependency information.
- Dependencies allow software to reuse shared libraries instead of duplicating code.
- `apt update` refreshes repository metadata, while `apt upgrade` updates installed software.
- `dpkg` provides detailed information about packages already installed on the system.
- Stable server environments prioritize reliability over always using the latest available software.

## Project Resolution Summary

| Field | Value |
|-------|-------|
| Estimated Time | ~10 hours |
| Environment | Ubuntu Server 26.04 LTS |
| Tools | Bash, APT, DPKG, SSH, VSCode |