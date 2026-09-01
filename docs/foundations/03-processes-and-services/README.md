# Project 03 — Processes and Services

## Overview

A Linux server is a living system where hundreds of processes and services interact continuously.

This project focuses on understanding how programs become running processes, how Linux manages process lifecycles, and how modern systems use `systemd` to control long-running services.

The objective was not to memorize commands, but to develop a mental model of how a Linux server operates while it is running and how system administrators diagnose and manage processes in production environments.

## Learning Objectives

By the end of this project I was able to:

- Distinguish between programs, processes and services.
- Understand the concept of Process IDs (PIDs).
- Explore process hierarchies and parent-child relationships.
- Manage foreground and background processes.
- Understand how Linux signals are used to control processes.
- Understand the role of `systemd` in modern Linux systems.
- Inspect and manage services using `systemctl`.
- Diagnose service behaviour using `journalctl`.
- Apply a structured troubleshooting workflow for system services.

## Concepts Covered

- Programs vs Processes
- Process IDs (PID)
- Parent and child processes
- Foreground and background execution
- Process lifecycle
- Linux signals
- Process trees
- systemd
- systemctl
- System services
- Journaling
- Log inspection
- Basic service troubleshooting

## Practical Exploration

This project explored the runtime behaviour of a Linux system by creating, inspecting and managing real processes.

Different execution scenarios were reproduced using foreground and background jobs, process hierarchies were analysed, and process control was practised using standard Linux signals.

Modern service management was introduced through `systemd`, inspecting service units, monitoring their status and analysing system logs using `journalctl` to simulate real-world troubleshooting scenarios.

## Key Takeaways

- A program is a file on disk; a process is a running instance of that program.
- Services are long-running processes managed by `systemd`.
- Every process has a unique PID and belongs to a process hierarchy.
- `systemctl` is the interface used to communicate with `systemd`.
- System logs are often the primary source of information when diagnosing service failures.
- Effective system administration is based on observation and diagnosis before taking corrective actions.

## Project Resolution Summary

| Field | Value |
|-------|-------|
| Estimated Time | ~12 hours |
| Environment | Ubuntu Server 26.04 LTS |
| Tools | Bash, SSH, VSCode |