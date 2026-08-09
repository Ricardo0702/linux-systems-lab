# Users and Permissions Assessment

## Objective

Identify the local user accounts configured on the server, distinguish administrative users from system accounts, and verify that user privileges follow the principle of least privilege.

---

## Methodology

The assessment began by inspecting the local user database to identify all configured accounts.

Once the interactive users had been identified, their group memberships and administrative privileges were verified. Finally, the ownership and access permissions of the users' home directories were inspected to confirm that personal data was appropriately protected.

---

## Commands Used

```bash
getent passwd

id ricardo

id alberto

getent group sudo

ls -ld /home/ricardo

ls -ld /home/alberto
```

---

## Evidence Collected

The assessment identified two interactive local users:

* `ricardo`
* `alberto`

System service accounts were clearly distinguished through the use of non-interactive login shells such as `/usr/sbin/nologin` and `/bin/false`.

The primary administrative account belongs to the `sudo` group, while the secondary user remains a standard, non-privileged account.

Both home directories are owned by their respective users and protected through the expected Linux permission model.

---

## Technical Interpretation

The server demonstrates a correct separation between administrative users, standard users and system service accounts.

Administrative privileges are restricted to the intended account, following the principle of least privilege.

The ownership and permissions of the home directories are consistent with a secure multi-user Linux environment.

---

## Quick Reference

| Task                               | Command               |
| ---------------------------------- | --------------------- |
| List all local users               | `getent passwd`       |
| Display user identity and groups   | `id <user>`           |
| Display group memberships          | `groups <user>`       |
| Show members of the sudo group     | `getent group sudo`   |
| Inspect home directory permissions | `ls -ld /home/<user>` |
