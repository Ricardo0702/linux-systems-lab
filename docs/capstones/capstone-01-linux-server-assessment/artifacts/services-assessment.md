# Processes and Services Assessment

## Objective

Assess the operational state of the server by inspecting running system services, identifying potential service failures and verifying the correct operation of a critical infrastructure service.

---

## Methodology

The assessment began by obtaining an overview of the active system services managed by `systemd`.

The investigation then focused on identifying failed services to detect potential operational issues. Finally, the OpenSSH service was inspected in detail to verify its operational status and confirm that remote administration was functioning correctly.

---

## Commands Used

```bash
systemctl list-units --type=service

systemctl --state=failed

systemctl status ssh
```

---

## Evidence Collected

The server is currently running the expected set of core system services required for normal operation.

No failed `systemd` service units were identified during the assessment.

A detailed inspection of the OpenSSH service confirmed that:

* the service is active and running;
* it is listening for incoming SSH connections;
* remote administrative sessions have been successfully established.

---

## Technical Interpretation

The server is operating normally from a service management perspective.

Core operating system services are functioning as expected, and no failed service units were detected.

The successful operation of the OpenSSH service confirms that remote administration is available and that one of the most important infrastructure services is functioning correctly.

---

## Quick Reference

| Task                       | Command                               |
| -------------------------- | ------------------------------------- |
| List running services      | `systemctl list-units --type=service` |
| List failed services       | `systemctl --state=failed`            |
| Inspect a specific service | `systemctl status <service>`          |
| View service logs          | `journalctl -u <service>`             |
| Show active processes      | `ps aux`                              |
| Real-time process monitor  | `htop`                                |
