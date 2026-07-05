# SIEM Lab 22 – Index Maintenance & Data Retention

## Lab Objectives

* Understand index maintenance within Elasticsearch.
* Analyze existing index usage and storage statistics.
* Configure data retention policies using Index Lifecycle Management (ILM).
* Verify how Elasticsearch handles data after retention periods.

---

## Prerequisites

* Elasticsearch installed and running
* Kibana accessible
* Administrative access to Elasticsearch
* Basic understanding of indices and data retention

---

# Introduction

Index maintenance and data retention are critical components of managing large-scale log environments. Proper maintenance improves performance while retention policies help optimize storage and ensure compliance requirements.

---

# Task 1: Understanding Index Maintenance

## Subtask 1.1 – Identify Existing Indexes

The following command was executed in Kibana Dev Tools:

```json
GET _cat/indices?v
```

### Result

All available Elasticsearch indices were displayed.

Example:

```text
.kibana
filebeat-*
suspicious-login-logs
```

---

## Subtask 1.2 – Analyze Index Usage

Cluster statistics were reviewed.

```json
GET _stats
```

Specific index statistics:

```json
GET filebeat-*/_stats
```

### Information Reviewed

* Document Count
* Storage Usage
* Search Queries
* Index Size

### Result

Index activity and storage consumption were successfully analyzed.

---

# Task 2: Configuring Data Retention

## Subtask 2.1 – Review Existing Policies

Existing ILM policies were reviewed.

```json
GET _ilm/policy
```

### Result

Available retention policies were displayed.

---

## Subtask 2.2 – Create a 30-Day Retention Policy

The following ILM policy was created:

```json
PUT _ilm/policy/log-retention-30days
{
  "policy": {
    "phases": {
      "hot": {
        "actions": {}
      },
      "delete": {
        "min_age": "30d",
        "actions": {
          "delete": {}
        }
      }
    }
  }
}
```

Verify:

```json
GET _ilm/policy/log-retention-30days
```

### Result

A retention policy was successfully created to remove logs older than 30 days.

---

# Task 3: Verify Data Handling Post-Retention Period

## Subtask 3.1 – Create Test Data

A test index was created.

```json
PUT retention-test
```

A sample document was inserted.

```json
POST retention-test/_doc
{
  "message": "Retention Policy Test",
  "@timestamp": "2026-06-18T10:00:00Z"
}
```

Verify:

```json
GET retention-test/_search
```

### Result

Test data was successfully indexed.

---

## Subtask 3.2 – Validate Lifecycle Policy

Lifecycle status was checked.

```json
GET retention-test/_ilm/explain
```

### Expected Output

```text
managed: true
policy: log-retention-30days
phase: hot
```

### Result

The retention policy was successfully attached and active.

---

# Screenshots

### Screenshot 1

List of Elasticsearch indices.

### Screenshot 2

30-day retention policy configuration.

### Screenshot 3

Index lifecycle management status.

---

# Key Concepts Learned

## Index Maintenance

Managing indices for optimal performance and storage efficiency.

## Index Lifecycle Management (ILM)

Automated lifecycle management of Elasticsearch indices.

## Data Retention

Controlling how long logs are retained before deletion.

## Storage Optimization

Reducing storage usage by automatically removing outdated data.

## Compliance

Maintaining retention policies that align with organizational requirements.

---

# Conclusion

In this lab, Elasticsearch index maintenance was explored by reviewing existing indices and analyzing their usage statistics. A 30-day data retention policy was created using Index Lifecycle Management (ILM), and lifecycle status verification confirmed that the retention policy was functioning correctly. These practices help maintain storage efficiency, improve system performance, and support compliance requirements.
