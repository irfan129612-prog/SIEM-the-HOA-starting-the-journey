# SIEM Lab 34 – Creating a Test Incident Response Plan

## Overview

An Incident Response Plan (IRP) provides a structured approach for detecting, responding to, containing, and recovering from cybersecurity incidents. A well-defined IRP helps organizations reduce response time, minimize business impact, and improve overall security readiness.

In this lab, a basic Incident Response Plan was developed, escalation procedures were established, and a tabletop exercise was conducted to validate the effectiveness of the response process.

---

## Lab Objectives

* Develop a basic Incident Response Plan.
* Define incident response roles and responsibilities.
* Establish escalation procedures for different incident severities.
* Conduct a tabletop exercise.
* Validate incident response readiness.

---

## Scenario

A phishing email successfully compromises a user account and results in unauthorized access to sensitive HOA information.

The incident response team must identify, contain, investigate, and recover from the incident.

---

# Task 1 – Define Roles and Responsibilities

## Incident Response Team Structure

| Role                      | Responsibilities                                                      |
| ------------------------- | --------------------------------------------------------------------- |
| Incident Response Manager | Coordinate incident response activities, communication, and reporting |
| HOA Security Lead         | Monitor alerts, perform investigations, and assess risks              |
| IT Support                | Implement technical remediation and system recovery actions           |

---

## Incident Response Manager

### Responsibilities

* Lead incident response efforts.
* Coordinate team communication.
* Approve response decisions.
* Prepare executive reports.

---

## HOA Security Lead

### Responsibilities

* Monitor SIEM alerts.
* Investigate suspicious activities.
* Assess incident severity.
* Document findings.

---

## IT Support

### Responsibilities

* Isolate affected systems.
* Implement remediation actions.
* Restore services.
* Verify system recovery.

---

# Task 2 – Establish Escalation Procedures

## Severity Levels

### Low Severity

Examples:

* Single malware alert.
* Failed login attempts.
* Minor policy violations.

### Response Requirements

* Notify IT Support.
* Resolve within 24 hours.
* Document incident.

---

### Medium Severity

Examples:

* Unauthorized access attempts.
* Suspicious user activity.
* Limited system disruption.

### Response Requirements

* Notify IT Support and HOA Security Lead.
* Begin investigation within 4 hours.
* Report findings to Incident Response Manager.

---

### High Severity

Examples:

* Data breach.
* Ransomware attack.
* Major service outage.
* Privileged account compromise.

### Response Requirements

* Immediately notify Incident Response Manager.
* Activate full Incident Response Team.
* Initiate containment procedures.
* Prepare executive communication.
* Perform full forensic investigation.

---

# Escalation Workflow

```text
Detection
    ↓
Initial Assessment
    ↓
Severity Classification
    ↓
Notification
    ↓
Containment
    ↓
Investigation
    ↓
Recovery
    ↓
Lessons Learned
```

---

# Task 3 – Conduct Mini Tabletop Exercise

## Scenario

A user receives a phishing email appearing to originate from a trusted HOA vendor.

The user clicks the malicious link and enters credentials into a fake login page.

Shortly afterward, unusual login activity is detected in the SIEM.

---

## Detection Phase

### Indicators

* Suspicious login attempts.
* New login location detected.
* Multiple authentication failures.

### Action

Security monitoring tools generate alerts.

---

## Notification Phase

### Team Notified

* Incident Response Manager
* HOA Security Lead
* IT Support Team

---

## Containment Phase

### Actions Taken

* Disable compromised account.
* Reset user password.
* Block malicious IP addresses.
* Monitor related systems.

---

## Investigation Phase

### Findings

* User credentials were compromised through phishing.
* Unauthorized login attempts were detected.
* No evidence of data exfiltration was identified.

---

## Recovery Phase

### Actions

* Restore user account access.
* Re-enable services.
* Verify system integrity.
* Monitor environment for recurring activity.

---

# Lessons Learned

## Improvements Identified

* Increase phishing awareness training.
* Enable Multi-Factor Authentication (MFA).
* Improve email filtering policies.
* Conduct regular incident response exercises.

---

# Incident Summary

| Item              | Details         |
| ----------------- | --------------- |
| Incident Type     | Phishing Attack |
| Severity          | Medium          |
| Affected Asset    | User Account    |
| Detection Method  | SIEM Alert      |
| Response Time     | Within 4 Hours  |
| Resolution Status | Resolved        |

---

# Key Concepts Learned

## Incident Response Planning

Creating a structured process for handling security incidents.

## Role Definition

Assigning responsibilities to response team members.

## Escalation Procedures

Ensuring incidents receive appropriate attention based on severity.

## Tabletop Exercises

Testing incident response procedures through simulated scenarios.

## Continuous Improvement

Using lessons learned to strengthen future response efforts.

---

# Conclusion

In this lab, a basic Incident Response Plan was created and validated through a tabletop exercise. Team roles were defined, escalation procedures were established, and incident response actions were simulated. The exercise demonstrated the importance of preparation, communication, and structured response processes in managing cybersecurity incidents effectively.
