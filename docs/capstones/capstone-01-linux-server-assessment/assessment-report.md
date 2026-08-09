# Linux Server Assessment Report

## Executive Summary

An initial technical assessment was performed on an Ubuntu Server virtual machine intended to serve as the foundation for future Linux infrastructure projects.

The assessment focused on evaluating the current state of the operating system without introducing configuration changes, following a structured and evidence-based methodology.

Overall, the server was found to be in a healthy operational state. No critical issues affecting system stability, security or network connectivity were identified during the assessment.

---

## Assessment Scope

The following areas were evaluated:

* Linux filesystem organization
* Local users and permissions
* Running processes and system services
* Package management
* Network configuration and connectivity

Supporting evidence for each section is available in the corresponding technical artifacts.

---

## Assessment Findings

### 1. Filesystem

The server follows the expected filesystem hierarchy of a standard Ubuntu Server installation.

Core directories required for system administration and normal operating system functionality are present and correctly organised. No structural anomalies were identified during the initial inspection.

---

### 2. Users and Permissions

The assessment identified two interactive local user accounts:

* `ricardo`, configured as the primary administrative user.
* `alberto`, configured as a standard local user.

System service accounts are correctly separated from human users through the use of non-interactive login shells.

Administrative privileges are appropriately restricted, following the principle of least privilege.

---

### 3. Processes and Services

Core operating system services were running normally during the assessment.

No failed `systemd` units were detected.

The OpenSSH service was operating correctly and successfully accepting remote administrative connections, confirming that remote management is functional.

---

### 4. Package Management

APT repositories were successfully contacted and package metadata was refreshed without errors.

The assessment identified two pending package updates related to Ubuntu software management utilities.

No package management errors or repository configuration issues were observed.

---

### 5. Network Configuration

The server has a valid IPv4 configuration and a correctly configured default gateway.

The routing table contains the expected directly connected network together with a default route for external communication.

The network configuration is consistent with the current virtualized environment and no routing anomalies were detected.

---

## Overall Assessment

The evaluated Ubuntu Server is correctly configured for continued use within the Linux Systems Lab.

The operating system demonstrates a consistent filesystem structure, an appropriate separation between administrative and standard users, correctly functioning system services, a healthy package management configuration and a valid network configuration.

The only observation identified during the assessment is the presence of two pending package updates, which represent routine maintenance rather than an operational issue.

---

## Recommendations

* Apply pending package updates during the next planned maintenance window.
* Continue following the principle of least privilege when creating additional users.
* Periodically review running services and package updates as part of routine system administration.
* Maintain regular technical assessments as the laboratory infrastructure grows and additional services are deployed.

---

## Conclusion

The server successfully meets the requirements for continued use as the foundation of future Linux Systems Lab projects.

No critical findings were identified during the assessment, and the overall system state can be considered stable, consistent and suitable for further development.
