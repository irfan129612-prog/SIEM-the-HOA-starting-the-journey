# SIEM Lab 16 – Investigating Alerts in a SIEM System

## Lab Objectives

* Understand how to locate and interpret alerts in a Security Information and Event Management (SIEM) system.
* Develop the skills to drill down into raw event data associated with an alert.
* Document findings and propose potential next steps for incident response.

---

## Prerequisites

* Basic understanding of cybersecurity concepts and incident response.
* Familiarity with using a Linux terminal.
* Access to an open-source SIEM platform such as ELK Stack.
* Basic knowledge of how to navigate and use Kibana.

---

# Task 1: Locate an Alert in the SIEM

## Step 1.1 – Access the SIEM Dashboard

The Kibana dashboard was accessed through a web browser.

```text
Kibana → Dev Tools
```

A sample suspicious login event was created to simulate a security alert.

### Create Test Alert

```json
POST suspicious-login-logs/_doc
{
  "@timestamp": "2026-06-18T12:30:00Z",
  "alert.category": "suspicious_login",
  "source.ip": "192.168.1.100",
  "user.name": "jdoe",
  "action": "login_attempt",
  "status": "failed",
  "message": "Suspicious failed login attempt detected"
}
```

### Result

A suspicious login event was successfully created and indexed in Elasticsearch.

---

## Step 1.2 – Identify a Suspicious Login Alert

The created event was searched and reviewed.

### Search Query

```json
GET suspicious-login-logs/_search
{
  "query": {
    "match": {
      "alert.category": "suspicious_login"
    }
  }
}
```

### Result

The suspicious login alert was successfully located.

---

## Step 1.3 – Filter Alerts

A filter was applied to identify suspicious login activity.

```json
{
  "query": {
    "bool": {
      "must": [
        {
          "match": {
            "alert.category": "suspicious_login"
          }
        }
      ]
    }
  }
}
```

### Result

Filtered results displayed only suspicious login events.

---

# Task 2: Drill Down to the Raw Events

## Step 2.1 – Access Raw Event Data

The suspicious login alert was opened and reviewed.

The following fields were examined:

* Timestamp
* Source IP Address
* Username
* Action
* Status

### Raw Event

```json
{
  "@timestamp": "2026-06-18T12:30:00Z",
  "source.ip": "192.168.1.100",
  "user.name": "jdoe",
  "action": "login_attempt",
  "status": "failed"
}
```

---

## Step 2.2 – Analyze the Logs

### Event Analysis

| Field     | Value                |
| --------- | -------------------- |
| Timestamp | 2026-06-18T12:30:00Z |
| Source IP | 192.168.1.100        |
| User      | jdoe                 |
| Action    | login_attempt        |
| Status    | failed               |

### Findings

The login attempt originated from source IP address **192.168.1.100** and targeted user account **jdoe**.

The authentication attempt failed, indicating possible unauthorized access activity or password guessing attempts.

### Result

The raw event data was successfully analyzed.

---

# Task 3: Document Findings and Potential Next Steps

## Step 3.1 – Document Key Findings

### Investigation Summary

A suspicious login alert was identified and investigated.

### Key Findings

* Failed authentication attempt detected.
* User account targeted: **jdoe**
* Source IP identified: **192.168.1.100**
* Activity classified as suspicious login behavior.

### Evidence Collected

* Alert details
* Raw event logs
* Source IP information
* Authentication status

---

## Step 3.2 – Propose Next Steps

### Recommended Actions

1. Block or monitor source IP address 192.168.1.100.
2. Review additional authentication logs.
3. Perform a password reset for the affected account.
4. Enable multi-factor authentication (MFA).
5. Continue monitoring for repeated login attempts.
6. Review firewall and access control configurations.

### Example Recommendation

```text
Based on the suspicious login attempt from IP address 192.168.1.100, it is recommended to temporarily block the source IP address, review authentication activity, and reset the affected user account password.
```

### Result

Appropriate incident response recommendations were documented.

---

# Screenshots

### Screenshot 1

Creating and locating the suspicious login alert in Kibana.

### Screenshot 2

Raw event analysis showing source IP, user account, and authentication status.

### Screenshot 3

Investigation findings and recommended actions.

---

# Key Concepts Learned

## Alert Investigation

The process of locating and analyzing suspicious security alerts.

## Log Analysis

Reviewing raw security events to understand attack behavior.

## Event Correlation

Connecting related security events to identify threats.

## Incident Response

Taking corrective actions to contain and mitigate security incidents.

## Security Monitoring

Continuous monitoring of authentication and security-related activity.

---

# Conclusion

In this lab, a suspicious login alert was created, located, and investigated using Kibana. Raw event data was analyzed to identify the source IP address, affected user account, and authentication outcome. Based on the findings, several incident response recommendations were proposed. This lab demonstrated the importance of alert investigation, log analysis, and proactive security monitoring within a SIEM environment.
