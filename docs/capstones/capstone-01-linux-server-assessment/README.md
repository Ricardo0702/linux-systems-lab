# Capstone Project 01 — Linux Server Assessment

## Overview

This Capstone Project consolidates the knowledge developed throughout the first five projects of the Linux Systems Lab.

The objective was to perform an initial technical assessment of an Ubuntu Server virtual machine, following a structured systems administration methodology and collecting evidence about its current configuration and operational state.

Unlike the previous learning projects, this Capstone focuses on applying previously acquired knowledge independently within a realistic infrastructure scenario.

## Assessment Scope

The server assessment covered the following technical areas:

* Linux filesystem organization
* Local users, groups and permissions
* Running processes and system services
* Package management and pending updates
* Network configuration, routing and connectivity

## Methodology

The assessment followed a non-invasive, evidence-based methodology:

1. Define the technical question to be answered.
2. Select the appropriate Linux inspection tools.
3. Collect only the information relevant to the assessment.
4. Interpret the results from a systems administration perspective.
5. Record findings and supporting commands in dedicated technical artifacts.
6. Summarize the overall state of the server in a final assessment report.

The server was not modified unless a command was required to refresh information safely, such as updating the local APT package index.

## Skills Demonstrated

* Linux filesystem inspection
* User and privilege assessment
* File ownership and permission analysis
* Process and service inspection
* `systemd` service diagnostics
* Package update assessment
* Linux interface and routing analysis
* Structured troubleshooting
* Technical evidence collection
* Professional infrastructure documentation

## Repository Structure

```text
capstone-01-linux-server-assessment/
├── README.md
├── scenario.md
├── assessment-report.md
├── artifacts/
│   ├── filesystem-assessment.md
│   ├── users-assessment.md
│   ├── services-assessment.md
│   ├── packages-assessment.md
│   └── networking-assessment.md
└── assets/
```

### Documentation

* [`scenario.md`](scenario.md) contains the original infrastructure assessment request.
* [`assessment-report.md`](assessment-report.md) contains the final technical findings, observations and recommendations.

### Technical Artifacts

The [`artifacts`](artifacts/) directory contains focused investigation notes for each assessment area. Every artifact documents:

* the objective of the inspection;
* the commands used;
* the relevant output;
* the technical interpretation;
* a quick command reference.

### Visual Resources

The [`assets`](assets/) directory is reserved for diagrams and visual resources that support the assessment methodology.

## Projects Integrated

This Capstone applies concepts developed in:

* Project 01 — Linux Filesystem Anatomy
* Project 02 — Users, Groups and Permissions
* Project 03 — Processes and Services
* Project 04 — Package Management and Software Installation
* Project 05 — Linux Networking Fundamentals

## Project Metadata

| Field               | Value                             |
| ------------------- | --------------------------------- |
| Environment         | Ubuntu Server 26.04 LTS ARM       |
| Platform            | VMware Fusion on Apple Silicon    |
| Assessment Approach | Non-invasive technical inspection |
| Integrated Projects | Projects 01–05                    |
| Status              | Completed                         |
