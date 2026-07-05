# SIEM Lab 35 – Generating Security Reports

## Overview

Security reporting is a fundamental part of Security Operations Center (SOC) activities. Security reports help analysts identify critical threats, review security events, measure system health, and communicate findings to stakeholders.

In this lab, security event data was collected, filtered, analyzed, and exported into PDF and CSV formats using open-source tools and Linux command-line utilities.

---

## Lab Objectives

* Learn to generate security reports.
* Collect and analyze security event data.
* Extract critical and error-related events.
* Export reports into multiple formats.
* Interpret key security findings.

---

## Tools Used

| Tool      | Purpose           |
| --------- | ----------------- |
| Linux CLI | Log Analysis      |
| grep      | Event Filtering   |
| Bash      | Report Generation |
| Pandoc    | PDF Export        |
| Python    | CSV Export        |

---

# Task 1 – Set Up Security Monitoring Tool

## Update Repository Information

```bash
sudo apt-get update
```

## Search for OSSEC

```bash
sudo apt-cache search ossec
```

## Attempt Installation

```bash
sudo apt-get install ossec-hids
```

### Observation

The OSSEC package was not available in the default Ubuntu repository.

### Result

The installation attempt was documented and alternative sample security data was used for report generation.

---

# Task 2 – Collect Security Event Data

## Create Sample Security Events

```text
INFO User login successful
WARNING Multiple failed login attempts
CRITICAL Unauthorized access detected
ERROR Firewall service stopped
CRITICAL Malware activity detected
INFO Backup completed
```

### Result

Security event data was successfully prepared for analysis.

---

# Task 3 – Generate Security Reports

## Extract Critical Events

```bash
grep "CRITICAL" security_events.log
```

### Output

```text
CRITICAL Unauthorized access detected
CRITICAL Malware activity detected
```

---

## Extract Error Events

```bash
grep -i "error" security_events.log
```

### Output

```text
ERROR Firewall service stopped
```

---

## Create Security Report

```bash
echo "Security Report Summary" > summary.log

grep -E "CRITICAL|ERROR|WARNING" security_events.log >> summary.log
```

### Report Contents

```text
Security Report Summary

WARNING Multiple failed login attempts
CRITICAL Unauthorized access detected
ERROR Firewall service stopped
CRITICAL Malware activity detected
```

### Result

Important security events were successfully compiled into a summary report.

---

# Task 4 – Export Report

## Export Report to PDF

```bash
pandoc summary.log -o security_report.pdf
```

### Result

A PDF version of the report was generated.

---

## Export Report to CSV

### Python Script

```python
import csv

with open('summary.log', 'r') as infile, open('report.csv', 'w', newline='') as outfile:
    writer = csv.writer(outfile)

    for line in infile:
        writer.writerow([line.strip()])
```

### Execute Script

```bash
python3 report.py
```

### Result

A CSV report was successfully generated.

---

# Security Findings

| Event Type | Finding                        |
| ---------- | ------------------------------ |
| WARNING    | Multiple Failed Login Attempts |
| CRITICAL   | Unauthorized Access Detected   |
| ERROR      | Firewall Service Stopped       |
| CRITICAL   | Malware Activity Detected      |

---

# Key Metrics

| Metric               | Count |
| -------------------- | ----- |
| Total Events         | 6     |
| Critical Events      | 2     |
| Warning Events       | 1     |
| Error Events         | 1     |
| Informational Events | 2     |

---

# Key Concepts Learned

## Security Monitoring

Collecting and reviewing security events.

## Event Filtering

Identifying relevant security information from logs.

## Security Reporting

Creating reports to summarize findings.

## Data Export

Converting reports into different formats for sharing and analysis.

## Incident Visibility

Improving awareness of security threats and operational issues.

---

# Conclusion

In this lab, security event data was collected, analyzed, and transformed into actionable security reports. Critical events, warnings, and errors were identified and summarized. The final reports were exported in PDF and CSV formats, demonstrating how security teams can efficiently communicate security findings and support incident response activities.
