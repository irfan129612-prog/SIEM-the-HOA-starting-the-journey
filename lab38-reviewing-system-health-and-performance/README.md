# SIEM Lab 38 – Reviewing System Health & Performance

## Overview

Maintaining SIEM performance requires continuous monitoring of system resources, ingestion activity, indexing performance, and system logs. Reviewing these metrics helps identify bottlenecks and maintain efficient security monitoring operations.

In this lab, CPU utilization, memory consumption, ingestion metrics, and system logs were reviewed to assess overall system health.

---

## Lab Objectives

* Examine CPU and memory usage.
* Review ingestion activity.
* Analyze indexing performance indicators.
* Identify system bottlenecks.
* Generate a health assessment report.

---

## Tools Used

| Tool      | Purpose            |
| --------- | ------------------ |
| Linux CLI | System Monitoring  |
| free      | Memory Analysis    |
| lscpu     | CPU Information    |
| df        | Disk Utilization   |
| grep      | Log Analysis       |
| awk       | Metric Calculation |

---

# Task 1 – Examine CPU and Memory Usage

## CPU Information

```bash
lscpu
```

### Purpose

Display processor architecture, CPU cores, threads, and utilization capabilities.

---

## Memory Usage

```bash
free -h
```

### Purpose

Display total, used, and available memory.

---

## System Load

```bash
uptime
```

### Purpose

Review load averages and system activity.

---

## Running Processes

```bash
top -b -n 1 | head -20
```

### Purpose

Identify resource-intensive processes.

---

# Task 2 – Review Ingestion Rates

## Create Sample Ingestion Metrics

```text
logs_ingested=120
logs_ingested=145
logs_ingested=160
logs_ingested=190
```

### Purpose

Simulate log ingestion activity.

---

## Calculate Average Ingestion Rate

```bash
awk -F= '{sum+=$2} END {print "Average Logs:",sum/NR}' ingestion.log
```

### Example Output

```text
Average Logs: 153.75
```

### Result

Log ingestion performance successfully reviewed.

---

# Task 3 – Identify Bottlenecks and Errors

## Review System Errors

```bash
grep -i "error" /var/log/syslog
```

### Purpose

Identify application or operating system errors.

---

## Review Warnings

```bash
grep -i "warning" /var/log/syslog
```

### Purpose

Locate warning events indicating potential issues.

---

## Disk Utilization

```bash
df -h
```

### Purpose

Check storage consumption and capacity.

---

# Health Report Generation

## Generate Report

```bash
echo "System Health Report" > health_report.txt

free -h >> health_report.txt

df -h >> health_report.txt

uptime >> health_report.txt
```

### Report Contents

* Memory Usage
* Disk Utilization
* System Load
* Performance Summary

---

# Validation

## Validation Steps

* CPU information reviewed.
* Memory usage analyzed.
* Disk utilization checked.
* Ingestion metrics calculated.
* System logs inspected.
* Health report generated.

### Status

```text
System Health Review Completed Successfully
```

---

# Key Concepts Learned

## CPU Utilization

Measurement of processor workload and performance.

## Memory Monitoring

Tracking RAM consumption and availability.

## Ingestion Rate

The speed at which logs are received and processed.

## Bottleneck Analysis

Identifying performance constraints affecting system efficiency.

## System Health Assessment

Evaluating overall operational stability.

---

# Lab Outcome

System health metrics were reviewed successfully. CPU, memory, storage, ingestion activity, and system logs were analyzed to assess SIEM performance and identify potential issues.

---

# Conclusion

This lab demonstrated how to review system health and performance using open-source monitoring techniques. By analyzing resource utilization, ingestion activity, and system logs, administrators can proactively identify issues and optimize SIEM operations.
