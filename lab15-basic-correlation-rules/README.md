# SIEM Lab 15 – Basic Correlation Rules

## Lab Objectives

- Understand the concept of correlation rules within a Security Information and Event Management (SIEM) system.
- Learn to identify scenarios of interest such as security threats.
- Develop skills to use open-source tools to define logic and thresholds for correlation rules.
- Generate and test events to ensure rules are correctly triggered.

---

## Prerequisites

- Basic knowledge of cybersecurity concepts.
- Familiarity with event logging and monitoring systems.
- Access to a computer with an open-source SIEM tool such as ELK Stack or Wazuh.
- Basic understanding of scripting or command-line usage.

---

# Task 1: Identify a Scenario for Correlation

## Step 1.1 – Define a Potential Security Threat

A common security threat scenario was selected for correlation rule testing.

### Scenario

```text
Multiple failed login attempts followed by a successful login.
```

This behavior may indicate:

- Brute-force attacks
- Password guessing attacks
- Credential stuffing
- Unauthorized account access

### Example

A user account experiences multiple failed authentication attempts within a short period and eventually logs in successfully.

---

## Step 1.2 – Document the Scenario Details

The following detection criteria were defined:

| Parameter | Value |
|------------|---------|
| Failed Login Attempts | 5 |
| Time Window | 10 Minutes |
| Successful Login | 1 |
| Severity | High |
| Risk Score | 75 |

### Result

A brute-force login detection scenario was successfully identified and documented.

---

# Task 2: Use SIEM Rule Editor

## Step 2.1 – Access SIEM Tool

Kibana Security was accessed through the web interface.

```text
Security → Rules
```

---

## Step 2.2 – Navigate to Rule Editor

A new detection rule was created.

```text
Create Rule → Threshold Rule
```

### Screenshot 1

Threshold Rule Creation Screen

---

## Step 2.3 – Define Logic for the Rule

The following logic was configured:

```text
event.action:"login_failed"
```

The rule monitors failed authentication events.

---

## Step 2.4 – Configure Threshold

The rule was configured to trigger when:

```text
5 failed login attempts occur within 10 minutes.
```

### Rule Configuration

| Setting | Value |
|----------|---------|
| Rule Type | Threshold Rule |
| Index Pattern | custom-logs* |
| Query | event.action:"login_failed" |
| Threshold | 5 |
| Time Window | 10 Minutes |
| Severity | High |
| Risk Score | 75 |
| Schedule | Every 5 Minutes |

### Result

The correlation rule was successfully configured and enabled.

---

# Task 3: Generate and Test Events

## Step 3.1 – Write a Script for Generating Log Events

A Python script was created to simulate authentication activity.

### correlation_test.py

```python
import logging
import time

logging.basicConfig(
    filename="failed_login_logs.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

for i in range(6):
    logging.info(f"Failed login attempt {i+1} for user admin")
    time.sleep(2)

logging.info("Successful login attempt for user admin")

print("Test authentication events generated successfully.")
```

---

## Execute Script

```bash
python3 correlation_test.py
```

Verify output:

```bash
cat failed_login_logs.log
```

### Generated Events

- Failed Login Attempt 1
- Failed Login Attempt 2
- Failed Login Attempt 3
- Failed Login Attempt 4
- Failed Login Attempt 5
- Failed Login Attempt 6
- Successful Login Attempt

### Screenshot 2

Python Script Execution and Generated Log Events

---

# Task 4: Monitor SIEM for Rule Trigger

## Step 4.1 – Open Alert Dashboard

Navigate to:

```text
Security → Rules
```

or

```text
Security → Alerts
```

---

## Step 4.2 – Verify Rule Execution

The following items were reviewed:

- Rule Status
- Last Run Time
- Rule Response
- Alert Activity
- Trigger Conditions

### Validation Checks

✔ Rule Created Successfully

✔ Rule Enabled

✔ Threshold Configured

✔ Test Events Generated

✔ Rule Running

---

## Screenshot 3

Detection Rule Monitoring Dashboard

---

## Commands Used

### Verify ELK Services

```bash
sudo systemctl status elasticsearch
sudo systemctl status kibana
```

### Verify Filebeat and Logstash

```bash
sudo systemctl status filebeat
sudo systemctl status logstash
```

### Generate Linux Test Event

```bash
logger "SIEM Lab 15 failed login test event"
```

### Run Python Test Script

```bash
python3 correlation_test.py
```

### View Generated Logs

```bash
cat failed_login_logs.log
```

### Insert Test Events into Elasticsearch

```json
POST custom-logs/_bulk
{"index":{}}
{"event.action":"login_failed","user":"admin"}
{"index":{}}
{"event.action":"login_failed","user":"admin"}
{"index":{}}
{"event.action":"login_failed","user":"admin"}
{"index":{}}
{"event.action":"login_failed","user":"admin"}
{"index":{}}
{"event.action":"login_failed","user":"admin"}
{"index":{}}
{"event.action":"login_success","user":"admin"}
```

### Verify Indexed Events

```json
GET custom-logs/_search
```

---

# Key Concepts Learned

## Correlation Rules

Correlation rules combine multiple events to identify suspicious activity patterns.

## Threshold Detection

Alerts are generated when a specified number of events occur within a defined time period.

## Brute Force Detection

Monitoring repeated failed login attempts helps identify password guessing attacks.

## Event Correlation

Multiple related events are analyzed together rather than individually.

## Security Monitoring

Continuous monitoring improves incident detection and response capabilities.

---

# Conclusion

In this lab, a basic SIEM correlation rule was created to detect multiple failed login attempts followed by a successful login. A threshold-based detection rule was configured in Kibana Security, authentication events were generated using a Python script, and rule execution was monitored through the SIEM dashboard. This exercise demonstrated how correlation rules help identify suspicious authentication behavior and improve security monitoring effectiveness.
