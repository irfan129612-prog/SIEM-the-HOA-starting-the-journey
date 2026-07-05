# SIEM Lab 21 – Searching & Filtering Data

## Lab Objectives

* Understand how to utilize field-based queries for efficient data searching.
* Learn to filter logs by time range or severity.
* Save frequently used queries for faster access.
* Improve log analysis and investigation skills using Kibana.

---

## Prerequisites

* Elasticsearch installed and running
* Kibana installed and accessible
* Sample logs indexed in Elasticsearch
* Basic understanding of log analysis

---

# Introduction

Searching and filtering are essential SIEM capabilities that help analysts quickly locate relevant events from large datasets. Efficient querying improves incident response and reduces investigation time.

---

# Task 1: Utilizing Field-Based Queries

## Overview

Field-based queries allow analysts to search within specific log fields, reducing irrelevant results.

---

## Step 1.1 – Open Kibana Discover

Navigate to:

```text
Analytics → Discover
```

---

## Step 1.2 – Execute Field-Based Query

Example query:

```kql
source.ip: 192.168.0.*
```

Alternative queries used during testing:

```kql
host.name: *

message: *
```

---

## Step 1.3 – Analyze Results

The returned logs were reviewed to identify:

* Matching source IP addresses
* Host activity
* Unusual log entries

### Result

Field-based queries successfully filtered relevant log entries.

---

# Task 2: Filtering Logs by Time Range or Severity

## Overview

Filtering allows analysts to focus on specific periods and event types.

---

## Step 2.1 – Configure Time Range

The Kibana time selector was set to:

```text
Last 24 Hours
```

---

## Step 2.2 – Apply Severity Filter

Example filters:

```kql
severity:error
```

Alternative filters:

```kql
log.level:error

message:*error*
```

---

## Step 2.3 – Validate Results

Filtered logs were inspected to ensure:

* Events occurred within the selected time range.
* Error-related events were displayed.

### Result

Relevant events were successfully filtered.

---

# Task 3: Saving a Frequently Used Query

## Overview

Saved queries improve efficiency by eliminating repetitive query creation.

---

## Step 3.1 – Execute Query

Query used:

```kql
message:*error*
```

---

## Step 3.2 – Save Query

The query was saved using Kibana's Save Query feature.

Name:

```text
Error_Logs_Last_24_Hours
```

Description:

```text
Displays error-related logs generated during the previous 24 hours.
```

---

## Step 3.3 – Verify Saved Query

Navigate to:

```text
Saved Queries
```

Load:

```text
Error_Logs_Last_24_Hours
```

### Result

The saved query was successfully stored and reused.

---

# Commands and Queries Used

```kql
source.ip: 192.168.0.*

host.name: *

message: *

severity:error

log.level:error

message:*error*
```

---

# Screenshots

### Screenshot 1

Field-based query results in Kibana Discover.

### Screenshot 2

Time range and severity filtering.

### Screenshot 3

Saved query displayed in Kibana.

---

# Key Concepts Learned

## Field-Based Queries

Searching within specific log fields for targeted analysis.

## Time Filtering

Restricting results to a selected time period.

## Severity Filtering

Identifying logs based on importance or risk level.

## Saved Queries

Reusable searches that improve analyst efficiency.

## Log Analysis

Investigating system and security events through structured queries.

---

# Conclusion

In this lab, field-based searches were performed using Kibana Discover. Logs were filtered by time range and severity to improve visibility into relevant events. Frequently used searches were saved for future use, demonstrating efficient log management and analysis techniques within a SIEM environment.
