# SIEM Lab 14 – Setting Up Email Notifications

## Overview

Email notifications are a critical component of Security Information and Event Management (SIEM) platforms. They provide immediate alerts to administrators when predefined security conditions are met, enabling rapid incident response and continuous monitoring.

In this lab, a Gmail SMTP server was configured within Kibana, an email connector was created, and an alert rule was configured to generate email notifications for failed login attempts.

---

## Objectives

- Understand SMTP-based email notifications.
- Configure Gmail SMTP settings within Kibana.
- Create and enable an alert rule.
- Validate email notification functionality.
- Improve security monitoring through automated alerts.

---

## Tools Used

- Elasticsearch
- Kibana
- Gmail SMTP
- Ubuntu Linux
- Elastic Security

---

## Environment

| Component | Value |
|------------|---------|
| Operating System | Ubuntu 24.04 LTS |
| SIEM Platform | Elastic Stack (ELK) |
| Kibana Version | Elastic 9.x |
| SMTP Service | Gmail SMTP |
| SMTP Host | smtp.gmail.com |
| SMTP Port | 587 |

---

## Task 1 – Verify ELK Services

The Elasticsearch and Kibana services were verified to ensure the SIEM environment was operational.

### Verification Commands

```bash
sudo systemctl status elasticsearch
sudo systemctl status kibana
```

### Result

Both services were running successfully and accessible through the Kibana web interface.

---

## Task 2 – Configure Gmail SMTP Connector

A Gmail SMTP connector was created within Kibana.

### SMTP Configuration

```ini
SMTP Host: smtp.gmail.com
Port: 587
Username: irfan129612@gmail.com
Authentication: Enabled
TLS: Enabled
```

### Result

The Gmail SMTP connector was successfully configured and linked to Kibana alerting functionality.

---

## Task 3 – Create Alert Rule

A custom detection rule was created to monitor failed login events.

### Rule Details

| Setting | Value |
|----------|---------|
| Rule Name | Failed Login Attempts |
| Rule Type | Custom Query |
| Severity | Medium |
| Risk Score | 50 |
| Schedule | Every 1 Minute |

### Query

```text
event:"failed_login"
```

### Action

```text
Send Email Notification
```

### Result

The alert rule was successfully created and enabled.

---

## Task 4 – Rule Monitoring

The created rule was monitored through the Elastic Security dashboard.

### Validation Checks

- Rule Enabled
- Scheduled Execution Active
- Alert Monitoring Operational
- Email Connector Linked

### Result

The rule executed successfully and was available for automated notification workflows.

---

## Screenshots

### Screenshot 1
ELK Stack service verification.

### Screenshot 2
Gmail SMTP connector configuration.

### Screenshot 3
Failed Login Attempts rule created and enabled.

---

## Key Concepts Learned

### SMTP

Simple Mail Transfer Protocol (SMTP) is used for sending email notifications between systems.

### Email Connector

A Kibana connector that integrates external email services with alerting mechanisms.

### Alert Rule

A condition-based configuration that generates alerts when specific events occur.

### Automated Notifications

Notifications generated automatically when predefined security thresholds are exceeded.

### Security Monitoring

Continuous monitoring of system events for threat detection and incident response.

---

## Conclusion

In this lab, Gmail SMTP was integrated with Kibana to provide email-based alerting functionality. A custom security rule was created and configured to monitor failed login events. The successful implementation of automated notifications demonstrates how SIEM platforms improve operational awareness and incident response through proactive alerting.
