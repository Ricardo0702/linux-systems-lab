# Package Management Assessment

## Objective

Assess the current state of the server's package management system by verifying repository availability, identifying pending software updates and confirming that the APT package manager is operating correctly.

---

## Methodology

The assessment began by refreshing the local package index to verify communication with the configured software repositories.

Once the package metadata had been updated successfully, the system was inspected for pending package upgrades in order to determine whether routine maintenance actions were required.

---

## Commands Used

```bash
sudo apt update

apt list --upgradable
```

---

## Evidence Collected

The configured Ubuntu repositories were successfully contacted and the local package index was refreshed without errors.

The assessment identified two pending package updates:

* `python3-software-properties`
* `software-properties-common`

No package management errors or repository configuration issues were detected during the assessment.

---

## Technical Interpretation

The package management system is functioning correctly and is able to communicate with the configured Ubuntu repositories.

The server is operational from a package management perspective. The only observation is the presence of two pending package updates related to Ubuntu software management utilities, representing routine maintenance rather than an operational issue.

---

## Quick Reference

| Task                        | Command                      |
| --------------------------- | ---------------------------- |
| Refresh package index       | `sudo apt update`            |
| List upgradable packages    | `apt list --upgradable`      |
| Search for a package        | `apt search <package>`       |
| Display package information | `apt show <package>`         |
| Install a package           | `sudo apt install <package>` |
| Remove a package            | `sudo apt remove <package>`  |
| Remove unused dependencies  | `sudo apt autoremove`        |
| Upgrade installed packages  | `sudo apt upgrade`           |
