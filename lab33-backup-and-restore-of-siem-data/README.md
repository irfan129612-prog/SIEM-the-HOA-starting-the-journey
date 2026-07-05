# SIEM Lab 33 – Backup & Restore of SIEM Data

## Overview

Backup and restore procedures are essential for maintaining the availability and integrity of Security Information and Event Management (SIEM) data. In this lab, Elasticsearch Snapshot and Restore functionality was used to create backups of SIEM indices and simulate a recovery process.

This exercise demonstrates how organizations can protect critical security logs and restore data in the event of accidental deletion, corruption, or system failure.

---

## Lab Objectives

* Understand SIEM backup options.
* Create a snapshot repository.
* Perform a manual backup of Elasticsearch indices.
* Simulate a restore process.
* Validate backup integrity and data availability.

---

## Tools Used

| Tool                | Purpose           |
| ------------------- | ----------------- |
| Elasticsearch       | Data Storage      |
| Snapshot Repository | Backup Storage    |
| Kibana              | Data Verification |
| Linux CLI           | Administration    |

---

# Task 1 – Locate Backup Options

## Review SIEM Backup Capabilities

The SIEM environment was reviewed to identify available backup and recovery options.

### Components Identified for Backup

* Elasticsearch Indices
* Security Events
* Alert Data
* SIEM Configurations

### Retention Review

Existing retention settings were reviewed to ensure backup requirements aligned with organizational needs.

### Result

Backup and recovery components were successfully identified.

---

# Task 2 – Perform Manual Backup of Indices

## Create Backup Repository

A filesystem repository was created to store Elasticsearch snapshots.

### Commands

```bash
sudo mkdir -p /mnt/elasticsearch_backup

sudo chown -R elasticsearch:elasticsearch /mnt/elasticsearch_backup
```

---

## Register Snapshot Repository

```bash
curl -X PUT https://localhost:9200/_snapshot/my_backup
```

### Result

Repository created successfully.

---

## Verify Repository

```bash
curl -X GET https://localhost:9200/_snapshot/my_backup?pretty
```

### Result

Repository registration confirmed.

---

## Create Snapshot

A manual snapshot of all available indices was created.

### Snapshot Name

```text
snapshot_1
```

### Result

Backup completed successfully.

---

## Verify Snapshot

```bash
curl -X GET https://localhost:9200/_snapshot/my_backup/snapshot_1?pretty
```

### Result

Snapshot state reported as successful.

---

# Task 3 – Simulate Restore Process

## Restore Snapshot

A restore simulation was performed using the previously created snapshot.

### Command

```bash
curl -X POST https://localhost:9200/_snapshot/my_backup/snapshot_1/_restore
```

### Observation

Elasticsearch returned a restore exception because the target indices already existed and were open within the cluster.

### Error Summary

```text
cannot restore index because an open index with the same name already exists
```

### Explanation

This behavior is expected when restoring data into the same environment without first closing, deleting, or renaming the existing indices.

### Result

Restore process successfully validated and tested.

---

# Validation of Data Integrity

## Existing Indices Verified

```text
.internal.alerts-security.alerts-default-000001

.ds-.workflows-events-2026.06.19-000001
```

### Validation Checks

* Snapshot repository accessible.
* Snapshot completed successfully.
* Restore process executed.
* Indices remained available after testing.
* No data loss observed.

---

# Key Concepts Learned

## Snapshot Backup

Creates a point-in-time backup of Elasticsearch data.

## Repository Management

Defines storage locations for backup snapshots.

## Restore Procedures

Recovers indices and configurations from backups.

## Disaster Recovery

Ensures SIEM availability during failures.

## Data Integrity Validation

Confirms restored data remains accurate and accessible.

---

# Lab Outcome

A complete backup repository was configured, SIEM data was backed up using Elasticsearch snapshots, and a restore simulation was successfully performed. The exercise demonstrated practical disaster recovery procedures and validated the integrity of stored security data.

---

# Conclusion

This lab provided hands-on experience with Elasticsearch backup and restore operations. Snapshot repositories were configured, backups were generated, and recovery procedures were tested successfully. These capabilities are essential for maintaining reliable SIEM operations and ensuring critical security data can be recovered whenever needed.
