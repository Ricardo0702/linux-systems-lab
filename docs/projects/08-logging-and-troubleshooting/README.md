# Project 08 — Linux Logging & Troubleshooting

## Overview

This project explores Linux logging and systematic troubleshooting using `systemd`, `journalctl`, and controlled service failures.

The goal was not only to learn how to query logs, but to develop a structured troubleshooting methodology based on evidence. Several controlled incidents were introduced to distinguish between application failures, execution problems, permission issues, unexpected process termination, and configuration errors.

The project also demonstrates how information from different system components can be correlated to identify the root cause of an incident.

---

## Learning Objectives

* Understand the Linux logging architecture and the relationship between `systemd-journald`, `rsyslog`, and traditional log files.
* Query and filter the systemd journal effectively.
* Investigate logs by service, boot, time range, kernel source, and priority.
* Interpret service exit codes and termination signals.
* Distinguish application failures from systemd execution failures.
* Correlate events from multiple logging sources.
* Diagnose controlled service incidents using evidence rather than assumptions.
* Apply a repeatable troubleshooting methodology.
* Verify that corrective actions actually resolve an incident.

---

## Concepts Covered

### Linux Logging Architecture

The system uses both the systemd journal and traditional text-based logs.

A simplified logging flow is:

```text
Applications / Services / Kernel
              │
              ▼
       systemd-journald
          │         │
          │         └──► systemd journal
          │
          └──► rsyslog
                    │
                    └──► /var/log/*
```

Relevant traditional logs explored included:

* `/var/log/syslog`
* `/var/log/auth.log`
* `/var/log/kern.log`
* `/var/log/dmesg`
* `/var/log/apt/`
* `/var/log/dpkg.log`

The presence of `/var/log/journal/` confirmed that persistent systemd journal storage was enabled.

### Journal Queries

The following `journalctl` filters were explored:

```bash
journalctl -n 20
journalctl -u ssh.service
journalctl -b
journalctl -b -1
journalctl --list-boots
journalctl -k
journalctl -p warning
journalctl --since "10 minutes ago"
journalctl --since "YYYY-MM-DD HH:MM:SS" --until "YYYY-MM-DD HH:MM:SS"
```

Filters can be combined to narrow an investigation:

```bash
journalctl -b -u ssh.service -p warning -n 20
```

Journal filters are generally independent of argument order, while pipelines represent an ordered flow of data.

For example:

```bash
journalctl -b -k | grep -i nvme
```

first retrieves kernel journal entries from the current boot and then performs text filtering with `grep`.

### Log Priorities

The standard syslog priority levels were reviewed:

```text
emerg
alert
crit
err
warning
notice
info
debug
```

A priority filter includes the selected priority and all more severe levels.

For example:

```bash
journalctl -p err
```

includes `err`, `crit`, `alert`, and `emerg`.

Log severity alone does not determine whether an event is relevant to an incident.

### Service State and Logs

`systemctl` and `journalctl` provide complementary information:

```text
systemctl status
→ current unit state and recent journal entries

journalctl -u <unit>
→ journal history associated with the unit
```

A service can also fail in different ways depending on where the failure occurs.

Examples observed during the project included:

```text
code=exited, status=1/FAILURE
```

for an application that executed but returned an error, and:

```text
status=203/EXEC
```

when systemd could not execute the configured `ExecStart`.

A process terminated by a signal produced:

```text
code=killed
status=9/KILL
Result: signal
```

---

## Practical Exploration

### Inspecting the Logging Environment

The contents of `/var/log` were inspected to identify traditional system logs and rotated log files.

The status of both logging services was verified:

```bash
systemctl status systemd-journald
systemctl status rsyslog
```

The system was confirmed to use the systemd journal together with traditional logs generated through `rsyslog`.

### Investigating SSH Activity

SSH events were inspected using unit filtering:

```bash
journalctl -u ssh.service
```

The journal exposed the complete service lifecycle, including:

* service startup,
* listening sockets,
* successful authentication,
* PAM session creation,
* service shutdown,
* events from previous boots.

Time-based filtering was then used to isolate a specific SSH startup and login sequence.

### Investigating Kernel Warnings

Kernel messages from the current boot were filtered by priority:

```bash
journalctl -b -p warning
journalctl -b -p err
journalctl -b -p crit
```

This demonstrated that a system can contain warnings and errors without necessarily experiencing an operational failure.

A suspicious NVMe timeout was investigated by expanding the surrounding time window and reviewing other NVMe events:

```bash
journalctl --since "..." --until "..."
journalctl -b -k | grep -i nvme
```

The timeout appeared to be an isolated event rather than evidence of a recurring storage failure.

This reinforced an important troubleshooting principle:

> A log entry is evidence, not a diagnosis.

### Controlled Application Failure

A systemd oneshot service was created around a Bash script that deliberately returned:

```bash
exit 1
```

Systemd reported:

```text
code=exited
status=1/FAILURE
```

Running the script directly and inspecting `$?` confirmed that the application itself returned the failure code.

Changing the script to return `0` resolved the incident.

### ExecStart Failure

A service was configured with an invalid executable path.

Systemd reported:

```text
status=203/EXEC
Failed at step EXEC
```

Direct execution and `ls -l` confirmed that the configured executable did not exist.

The service definition was corrected to reference a valid executable and successful execution was verified.

### Execution Permission Failure

Execution permission was removed from an otherwise valid script.

The service again produced:

```text
status=203/EXEC
```

Inspecting the file revealed:

```text
-rw-rw-r--
```

with no execute bit present.

Restoring execution permission with `chmod +x` allowed the service to start successfully.

This demonstrated that `203/EXEC` identifies an execution-stage problem but does not uniquely identify its root cause.

### Runtime Process Failure

A persistent service was created using a Bash loop:

```bash
while true
do
    sleep 30
done
```

Unlike a oneshot service, the unit remained:

```text
active (running)
```

The process hierarchy was inspected using `ps`, showing the Bash process as the service's main process and `sleep` as its child.

The main process was then terminated with `SIGKILL`.

Systemd reported:

```text
Result: signal
code=killed
status=9/KILL
```

The service-specific journal showed how the process terminated but not why it received the signal.

Expanding the journal around the incident revealed:

```text
COMMAND=/usr/bin/kill -9 <PID>
```

from a `sudo` event.

This demonstrated how correlating logs from multiple components can reveal a root cause that is not present in the affected service's own logs.

### Missing Configuration

A service was created that depended on:

```text
/etc/troubleshooting-app/app.conf
```

When the configuration file was absent, the application logged an error and returned exit code `1`.

The resource was verified directly with `ls`, created, and the service was successfully restarted.

### Configuration Troubleshooting Assessment

The final troubleshooting exercise simulated an application that was disabled through configuration.

The initial evidence was:

```text
ERROR: Application is disabled by configuration.
```

Inspection revealed:

```text
ENABLED=false
```

Removing the setting did not resolve the problem because the application explicitly required:

```text
ENABLED=true
```

The failed first correction was verified, the application logic was re-examined, and the configuration was corrected.

The service then returned to:

```text
active (running)
```

This exercise reinforced the importance of verifying every corrective action instead of assuming that a plausible change has resolved the incident.

---

## Key Takeaways

* Logs should be treated as evidence rather than automatic diagnoses.
* Troubleshooting should begin with the observed symptom and progressively narrow the investigation.
* `systemctl status` provides an effective first view of a failed service.
* `journalctl` allows investigations to be scoped by unit, boot, time, kernel source, and severity.
* Exit codes describe how a process completed but do not necessarily reveal the root cause.
* `203/EXEC` indicates that systemd could not execute `ExecStart`, but the underlying reason must still be investigated.
* A process killed by a signal may require investigation outside the affected service's own logs.
* Temporal correlation across system logs can reveal relationships between otherwise separate events.
* Configuration and external resources can cause an application to fail even when systemd and the executable are functioning correctly.
* A corrective action is not considered successful until the system is verified afterward.
* A useful troubleshooting workflow is:

```text
Symptom
   ↓
Gather information
   ↓
Identify affected component
   ↓
Inspect state and logs
   ↓
Form a hypothesis
   ↓
Test the hypothesis
   ↓
Identify root cause
   ↓
Correct
   ↓
Verify
```

---

## Project Resolution Summary

| Field               |                Value                                                                                                |
| ------------------- | ------------------------------------------------------------------------------------------------------------------- |
| Environment         | Ubuntu Server 26.04 LTS ARM                                                                                         |
| Platform            | VMware Fusion on Apple Silicon                                                                                      |
| Logging Stack       | systemd-journald, rsyslog                                                                                           |
| Main Tools          | journalctl, systemctl, ps, grep                                                                                     |
| Practical Work      | Controlled Service Failures, Log Analysis, Root Cause Investigation                                                 |
| Skills Demonstrated | Linux Logging, Service Troubleshooting, Log Filtering, Failure Analysis, Root Cause Analysis, Incident Verification |
