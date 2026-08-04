# Project 05 — Linux Networking Fundamentals

## Overview

Networking is one of the core pillars of every Linux system. Regardless of whether a server hosts a website, a database or a cloud application, communication with other systems relies on correctly configured network interfaces, routing, name resolution and listening services.

This project focuses on understanding how Linux implements fundamental networking concepts, following the complete path that a network packet takes through the operating system. Rather than revisiting networking theory, the objective was to understand how those concepts are represented, inspected and diagnosed in a real Linux environment.

## Learning Objectives

By the end of this project I was able to:

- Understand the role of network interfaces in Linux.
- Inspect interface configuration and assigned IP addresses.
- Understand the purpose of the loopback interface.
- Interpret the Linux routing table.
- Understand the role of the default gateway.
- Understand how DNS resolution works in Linux.
- Inspect DNS resolver configuration.
- Understand the relationship between IP addresses, ports and sockets.
- Inspect listening services using modern Linux networking tools.
- Apply a structured methodology for basic network troubleshooting.

## Concepts Covered

- Network interfaces
- Loopback interface
- IPv4 and IPv6 addresses
- Routing table
- Default gateway
- DNS
- Resolver configuration
- `/etc/resolv.conf`
- Ports
- Sockets
- TCP and UDP
- `ip`
- `ss`
- `ping`
- `getent`
- Basic network troubleshooting

## Practical Exploration

This project explored how Linux communicates with other systems by inspecting real network interfaces, IP addressing, routing information and DNS configuration.

Network connectivity was analysed using standard Linux tools, while listening services and sockets were inspected to understand how processes communicate through the network. Finally, a structured troubleshooting workflow was developed to diagnose common connectivity problems following a layered approach.

## Key Takeaways

- Network interfaces are the communication endpoints of a Linux system.
- IP addresses belong to interfaces rather than to the system as a whole.
- Every outgoing packet is evaluated against the kernel routing table.
- DNS resolution occurs before network communication can begin when using hostnames.
- Ports identify services, while sockets represent active communication endpoints.
- Modern Linux systems use the `ip` and `ss` utilities as the standard networking tools.
- Effective troubleshooting follows a structured workflow instead of relying on trial and error.

## Project Resolution Summary

| Field | Value |
|-------|-------|
| Estimated Time | ~12 hours |
| Environment | Ubuntu Server 26.04 LTS |
| Tools | Bash, IPRoute2 (`ip`), `ss`, `ping`, `getent`, SSH, VSCode |