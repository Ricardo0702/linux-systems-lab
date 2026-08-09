# Filesystem Assessment

## Objective

Verify that the server follows the expected Linux filesystem hierarchy before continuing with the remaining stages of the assessment.

---

## Methodology

A high-level inspection of the root filesystem was performed to verify that the operating system follows the standard directory hierarchy expected for an Ubuntu Server installation.

Rather than exploring every directory individually, the objective was to confirm that the core system directories were present and correctly organised before proceeding with deeper administrative checks.

---

## Commands Used

```bash
cd /
ls
```

---

## Evidence Collected

The inspection confirmed the presence of the expected top-level directories, including:

* `/etc`
* `/usr`
* `/var`
* `/home`
* `/dev`
* `/proc`
* `/root`

Ubuntu-specific directories such as `/snap` were also present.

---

## Technical Interpretation

The filesystem structure matches the expected layout of a standard Ubuntu Server installation.

No structural inconsistencies or unexpected top-level directories were identified during the assessment.

This provides confidence that the operating system has been deployed following the standard Linux Filesystem Hierarchy.

---

## Quick Reference

| Task                                  | Command       |
| ------------------------------------- | ------------- |
| Navigate to the root directory        | `cd /`        |
| List top-level directories            | `ls /`        |
| Show current directory                | `pwd`         |
| Display the directory tree            | `tree -L 1 /` |
