# Project 06 — Storage & Filesystems

## Overview

This project explores how Linux manages storage devices, partitions, filesystems and mount points.

Starting from a completely empty virtual disk, the entire storage lifecycle was completed manually, including partition table creation, filesystem initialization, manual mounting, persistent configuration through `/etc/fstab`, and post-reboot verification.

The project focuses on understanding the architecture behind Linux storage rather than simply learning individual commands.

---

## Learning Objectives

- Understand the relationship between disks, partitions and filesystems.
- Learn the purpose of partition tables (GPT and MBR).
- Create and format new partitions using Linux administration tools.
- Understand filesystem UUIDs and persistent device identification.
- Learn how Linux mounts filesystems into the directory tree.
- Configure persistent mounts using `/etc/fstab`.
- Verify storage configuration after system reboot.

---

## Concepts Covered

- Physical disks and block devices
- GPT vs MBR partition tables
- Linux partitions
- ext4 filesystem
- Filesystem UUIDs
- Mount points
- Runtime vs persistent mounts
- `/etc/fstab`
- `lsblk`
- `lsblk -f`
- `findmnt`
- `mkfs.ext4`
- `mount`
- `chown`
- Storage verification

---

## Practical Exploration

The project followed the complete lifecycle of preparing a new storage device for production use.

### 1. Storage inspection

The existing storage configuration was analyzed using:

- `lsblk`
- `lsblk -f`
- `findmnt`
- `/etc/fstab`

This allowed identification of:

- physical disks;
- partitions;
- filesystems;
- LVM logical volumes;
- mount points;
- persistent mounting configuration.

### 2. Adding a new storage device

A new virtual NVMe disk was attached to the Ubuntu virtual machine.

The operating system detected the new hardware as an uninitialized block device.

### 3. Creating a GPT partition table

A GUID Partition Table (GPT) was created using `fdisk`.

The differences between GPT and the legacy MBR partitioning scheme were explored.

### 4. Creating the first partition

A single Linux partition occupying the entire disk was created.

The relationship between partition tables and partitions was analyzed before writing changes to disk.

### 5. Creating an ext4 filesystem

The new partition was formatted with the ext4 filesystem using `mkfs.ext4`.

The project explored:

- filesystem metadata;
- UUID generation;
- inode allocation;
- journaling;
- superblock creation.

### 6. Mounting the filesystem

A new mount point (`/data`) was created.

The filesystem was mounted manually using `mount`, demonstrating how Linux integrates independent storage devices into a single directory tree.

The project also explored the relationship between mount points and the underlying filesystem hierarchy.

### 7. Permissions

Ownership and permissions of the newly mounted filesystem were analyzed.

The project demonstrated how filesystem ownership affects write operations performed by regular users.

### 8. Persistent configuration

The filesystem UUID was added to `/etc/fstab`.

Before rebooting, the configuration was validated using:

```bash
sudo mount -a
```

Finally, the system was rebooted to verify that the filesystem was mounted automatically.

---

## Key Takeaways

- A disk is not immediately usable after being attached to a system.
- Partition tables define how storage space is organized.
- Partitions must be formatted before files can be stored.
- Filesystems generate their own UUIDs during creation.
- Linux exposes every filesystem through a mount point.
- `/etc/fstab` defines persistent storage configuration.
- Runtime mounts and persistent mounts are different concepts.
- Device names may change between boots, while UUIDs remain stable.
- Proper ownership and permissions are essential before using newly created storage.

## Project Resolution Summary

| Field | Value |
|-------|-------|
| Environment | Ubuntu Server 26.04 LTS ARM |
| Platform | VMware Fusion on Apple Silicon |
| Filesystem | ext4 |
| Partition Scheme | GPT |
| Storage Workflow | Disk → GPT → Partition → Filesystem → Mount Point → fstab |
| Skills Demonstrated | Storage Administration, Filesystems, Mount Management, Persistent Storage Configuration |