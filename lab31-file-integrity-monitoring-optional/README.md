# SIEM Lab 31 – File Integrity Monitoring (FIM)

## Overview

File Integrity Monitoring (FIM) is a security process used to detect unauthorized modifications to files, directories, and system configurations. Monitoring critical files helps organizations identify malicious activity, configuration drift, and compliance violations.

In this lab, auditd was used to monitor changes made to the Linux system file `/etc/passwd`.

---

## Lab Objectives

* Understand the fundamentals of File Integrity Monitoring.
* Install and configure auditd.
* Monitor critical files for modifications.
* Generate file change events.
* Investigate audit logs and verify alerts.

---

## Tools Used

| Tool         | Purpose                   |
| ------------ | ------------------------- |
| auditd       | File Integrity Monitoring |
| auditctl     | Audit Rule Management     |
| ausearch     | Search Audit Logs         |
| aureport     | Audit Reporting           |
| Ubuntu Linux | Operating System          |

---

# Task 1 – Install and Configure auditd

## Install Packages

```bash
sudo apt update

sudo apt install -y auditd audispd-plugins
```

## Start Services

```bash
sudo systemctl start auditd

sudo systemctl enable auditd
```

## Verify Installation

```bash
auditctl -v
```

### Result

auditd was successfully installed and operational.

---

# Task 2 – Identify Files to Monitor

The file selected for monitoring:

```text
/etc/passwd
```

This file stores local user account information and is considered a critical system file.

### Verification

```bash
ls -l /etc/passwd
```

### Result

Target file identified successfully.

---

# Task 3 – Configure Monitoring Rules

## Create Audit Rule

```bash
sudo auditctl -w /etc/passwd -p wa -k passwd_changes
```

### Rule Parameters

| Option | Meaning                             |
| ------ | ----------------------------------- |
| -w     | Watch File                          |
| -p wa  | Monitor Write and Attribute Changes |
| -k     | Assign Searchable Key               |

## Verify Rule

```bash
sudo auditctl -l
```

### Result

Monitoring rule successfully applied.

---

# Task 4 – Generate Change Event

## Backup File

```bash
sudo cp /etc/passwd /tmp/passwd.bak
```

## Generate Safe Change

```bash
sudo touch /etc/passwd
```

### Result

File modification event generated.

---

# Task 5 – Verify Alert Generation

## Search Audit Logs

```bash
sudo ausearch -f /etc/passwd
```

## Search by Key

```bash
sudo ausearch -k passwd_changes
```

## Generate Report

```bash
sudo aureport -f
```

### Result

The audit system successfully recorded changes made to the monitored file.

---

# Screenshots

### Screenshot 1

auditd Installation Verification

### Screenshot 2

Target File Identification

### Screenshot 3

Audit Rule Configuration

### Screenshot 4

File Change Event

### Screenshot 5

Audit Alert Verification

---

# Key Concepts Learned

## File Integrity Monitoring

Monitoring files for unauthorized modifications.

## Audit Rules

Defining monitoring policies for files and directories.

## Event Logging

Recording system activities for security analysis.

## Audit Investigation

Reviewing audit logs to identify security-relevant changes.

## Compliance Monitoring

Using FIM to satisfy security and compliance requirements.

---

# Conclusion

In this lab, File Integrity Monitoring was implemented using auditd to monitor changes to the `/etc/passwd` file. Audit rules were created, file modification events were generated, and audit logs were successfully analyzed. This approach provides visibility into critical system changes and helps strengthen overall security monitoring capabilities.
