# Network Configuration Assessment

## Objective

Assess the server's network configuration by verifying its IP addressing, routing information and overall connectivity readiness.

---

## Methodology

The assessment focused on inspecting the server's routing table to identify the assigned IPv4 address, directly connected networks and the default gateway.

Rather than immediately performing connectivity tests, the network configuration was first validated to ensure that the operating system had sufficient information to communicate with external networks.

A structured troubleshooting methodology was also established for future network diagnostics.

---

## Commands Used

```bash
ip route
```

---

## Evidence Collected

The routing table confirmed:

* A valid IPv4 address assigned to the primary network interface.
* A directly connected local network.
* A correctly configured default gateway.
* Routing information obtained through DHCP.

The network configuration is consistent with the current virtualized environment.

---

## Technical Interpretation

The server has a valid network configuration suitable for communication within the local network and with external destinations.

The presence of a correctly configured default route confirms that the operating system knows how to forward traffic outside its local subnet.

Should connectivity issues arise in the future, network troubleshooting should follow a structured approach by validating each stage of the communication path independently.

---

## Quick Reference

| Task                              | Command                   |
| --------------------------------- | ------------------------- |
| Show interfaces                   | `ip -br addr`             |
| Display routing table             | `ip route`                |
| Test IP connectivity              | `ping <IP>`               |
| Test DNS resolution               | `getent hosts <hostname>` |
| Show listening sockets            | `ss -tulpn`               |
| Display DNS configuration         | `cat /etc/resolv.conf`    |
| Show network interfaces in detail | `ip addr`                 |
