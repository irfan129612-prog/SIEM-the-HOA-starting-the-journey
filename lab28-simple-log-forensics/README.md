# SIEM Lab 28 – Simple Log Forensics

## Overview

Log forensics is the process of analyzing log files to identify suspicious activities, security incidents, and potential threats. Security analysts use log analysis to investigate failed login attempts, unauthorized access, authentication failures, and other abnormal system behaviors.

In this lab, Linux command-line tools such as `grep`, `awk`, `sort`, and `uniq` were used to filter logs, identify suspicious events, analyze login attempts, and document forensic evidence.

---

## Lab Objectives

* Understand the basics of log forensics.
* Learn how to filter logs by a specific time range.
* Identify suspicious activities using command-line tools.
* Analyze failed login attempts and source IP addresses.
* Extract and document forensic evidence.

---

## Tools Used

| Tool         | Purpose                       |
| ------------ | ----------------------------- |
| grep         | Search and filter log entries |
| awk          | Extract specific log fields   |
| sort         | Organize log output           |
| uniq         | Count duplicate entries       |
| Ubuntu Linux | Operating System              |

---

# Task 1 – Select a Date/Time Range

## Create Sample Log File

A sample authentication log file was created for analysis.

### Command

```bash
mkdir ~/forensics-lab

nano ~/forensics-lab/auth.log
```

### Sample Log Data

```text
Jul 15 10:05:10 ubuntu sshd[1001]: Accepted password for admin from 192.168.1.5
Jul 15 10:15:22 ubuntu sshd[1002]: Failed password for root from 192.168.1.10
Jul 15 10:20:45 ubuntu sshd[1003]: Failed password for admin from 192.168.1.10
Jul 15 10:35:19 ubuntu sshd[1004]: Failed password for suspicious_user from 192.168.1.10
Jul 15 11:05:11 ubuntu sshd[1005]: Unauthorized access attempt from 192.168.1.20
Jul 15 11:30:45 ubuntu sshd[1006]: Error authentication failure from 192.168.1.30
Jul 15 12:10:00 ubuntu sshd[1007]: Accepted password for analyst from 192.168.1.50
```

### Result

A sample authentication log dataset was prepared for forensic investigation.

---

# Task 2 – Filter Logs by Time Range

## Investigation Window

```text
July 15, 10:00 AM – 12:00 PM
```

### Commands

```bash
grep 'Jul 15 10:' ~/forensics-lab/auth.log > filtered_logs.txt

grep 'Jul 15 11:' ~/forensics-lab/auth.log >> filtered_logs.txt

grep 'Jul 15 12:' ~/forensics-lab/auth.log | head -n 30 >> filtered_logs.txt
```

### Verify Results

```bash
cat filtered_logs.txt
```

### Result

Only logs within the investigation timeframe were extracted for analysis.

---

# Task 3 – Identify Suspicious Activity

## Search for Security-Related Keywords

### Command

```bash
grep -E 'Failed|Error|Unauthorized' filtered_logs.txt > suspicious_activity.txt
```

### Verify Results

```bash
cat suspicious_activity.txt
```

### Result

Suspicious authentication events were isolated from normal system activity.

---

# Task 4 – Analyze Failed Login Attempts

## Identify Repeated Failed Logins

### Command

```bash
awk '/Failed password/ {print $(NF)}' filtered_logs.txt | sort | uniq -c | sort -nr
```

### Example Output

```text
3 192.168.1.10
```

### Analysis

The source IP address `192.168.1.10` generated multiple failed login attempts within a short time period.

### Security Observation

This behavior may indicate:

* Password guessing
* Brute-force attack attempts
* Unauthorized access attempts

---

# Task 5 – Document Evidence

## Extract Important Evidence

### Command

```bash
awk '{print $1,$2,$3,$11,$13}' suspicious_activity.txt > evidence.txt
```

### View Evidence

```bash
cat evidence.txt
```

### Example Evidence

```text
Jul 15 10:15:22 root 192.168.1.10
Jul 15 10:20:45 admin 192.168.1.10
Jul 15 10:35:19 suspicious_user 192.168.1.10
```

### Result

Critical forensic information including usernames, timestamps, and source IP addresses was successfully extracted.

---

# Investigation Findings

## Suspicious User

```text
suspicious_user
```

## Source IP

```text
192.168.1.10
```

## Timestamp

```text
Jul 15 10:35:19
```

## Activity Detected

Multiple failed login attempts from the same IP address targeting different user accounts.

## Assessment

Potential brute-force login attack detected.

---

# Screenshots

### Screenshot 1

Sample Authentication Log File

### Screenshot 2

Filtered Logs Based on Investigation Time Range

### Screenshot 3

Suspicious Activity Search Results

### Screenshot 4

Failed Login Attempt Analysis

### Screenshot 5

Extracted Evidence File

---

# Key Concepts Learned

## Log Forensics

The process of analyzing log files to investigate security incidents.

## Timestamps

Used to establish when specific events occurred.

## IP Addresses

Help identify the origin of suspicious activities.

## Failed Authentication Analysis

Allows detection of brute-force and unauthorized access attempts.

## Evidence Collection

Critical step for incident investigation and documentation.

---

# Conclusion

In this lab, log forensic techniques were used to investigate suspicious authentication events. By filtering logs, identifying suspicious patterns, analyzing failed login attempts, and extracting forensic evidence, a potential brute-force attack was successfully identified.

The lab demonstrated how open-source Linux tools can be effectively used to perform security investigations and support incident response activities. These skills are fundamental for SOC Analysts, Incident Responders, and Cybersecurity Professionals.
