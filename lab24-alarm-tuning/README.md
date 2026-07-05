# SIEM Lab 24 – Alarm Tuning

## Lab Objectives

* Understand the principles of alarm tuning.
* Identify frequently triggered alerts.
* Implement exception conditions to reduce false positives.
* Validate alarm effectiveness after tuning.
* Improve alert quality and reduce monitoring noise.

---

# Introduction

Alarm tuning is an essential SIEM activity that improves detection quality by reducing false positives while maintaining visibility into genuine security threats. Proper tuning helps analysts focus on meaningful incidents rather than repetitive benign alerts.

---

# Task 1: Identify Frequent False Positive Alerts

## Step 1.1 – Review Existing Alerts

Existing alerts were reviewed through Kibana.

```json
GET .alerts*/_search
{
  "size": 20
}
```

### Result

Recent alerts were retrieved for analysis.

---

## Step 1.2 – Identify Frequently Triggered Alerts

Alert frequency was analyzed.

```json
GET .alerts*/_search
{
  "aggs": {
    "top_alerts": {
      "terms": {
        "field": "kibana.alert.rule.name.keyword",
        "size": 10
      }
    }
  }
}
```

### Findings

Example frequent alerts:

* Failed Login Attempts
* Suspicious Login Alerts
* Host Monitoring Events

### Result

Potential false-positive generating alerts were identified.

---

# Task 2: Add Exception Conditions

## Step 2.1 – Review Alert Source

A trusted internal IP address was identified:

```text
192.168.1.200
```

This IP repeatedly generated alerts despite being a legitimate internal system.

---

## Step 2.2 – Create Exception

The following exception condition was added:

```kql
NOT source.ip : "192.168.1.200"
```

### Result

The trusted IP address was excluded from future alert generation.

---

# Task 3: Test and Validate Changes

## Step 3.1 – Generate Benign Event

```json
POST suspicious-login-logs/_doc
{
  "source.ip":"192.168.1.200",
  "event.action":"login_attempt",
  "message":"Benign Internal Test Event"
}
```

### Result

Event was generated from the trusted IP.

---

## Step 3.2 – Generate Suspicious Event

```json
POST suspicious-login-logs/_doc
{
  "source.ip":"8.8.8.8",
  "event.action":"login_attempt",
  "message":"Potential External Login Attempt"
}
```

### Result

Event was generated from an external IP.

---

## Step 3.3 – Validate Alarm Behavior

Verification search:

```json
GET suspicious-login-logs/_search
```

### Validation Results

| Event Source  | Expected Outcome     |
| ------------- | -------------------- |
| 192.168.1.200 | Ignored by exception |
| 8.8.8.8       | Alert generated      |

### Result

Alarm tuning successfully reduced false positives while preserving legitimate threat detection.

---

# Screenshots

### Screenshot 1

Frequent alert analysis and alert counts.

### Screenshot 2

Rule exception configuration in Kibana.

### Screenshot 3

Validation showing exception and active alert behavior.

---

# Key Concepts Learned

## Alarm Tuning

Improving alert quality by reducing unnecessary notifications.

## False Positives

Alerts triggered by legitimate or expected activity.

## Exceptions

Rules used to exclude trusted systems from alert generation.

## Alert Validation

Testing alarm behavior after tuning changes.

## Detection Optimization

Balancing alert accuracy and operational effectiveness.

---

# Conclusion

In this lab, frequent alerts were analyzed to identify potential false positives. Exception conditions were implemented to exclude trusted systems from generating unnecessary alerts. Validation testing confirmed that legitimate threat detection remained functional while noise was significantly reduced. Effective alarm tuning improves SIEM efficiency and enables analysts to focus on meaningful security events.
