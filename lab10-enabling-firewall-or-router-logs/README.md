# SIEM Lab 10 – Enabling Firewall or Router Logs

## Overview

This lab demonstrates how to enable and verify logging functionality for network devices using Syslog. Since the Ubuntu lab environment does not provide a dedicated router or firewall operating system, the rsyslog service was used to simulate firewall/router log forwarding to a SIEM platform.

The objective was to verify logging support, configure a log destination, and confirm that log events were successfully transmitted for monitoring purposes.

---

## Objectives

* Understand the process of enabling logs on a firewall or router.
* Configure a Syslog destination for centralized monitoring.
* Verify that logs are being generated and forwarded correctly.
* Understand the role of Syslog in SIEM integrations.

---

## Lab Environment

| Component        | Description      |
| ---------------- | ---------------- |
| Operating System | Ubuntu Linux     |
| Logging Service  | rsyslog          |
| Monitoring Tool  | Wazuh SIEM       |
| Protocol         | Syslog (UDP 514) |

---

## Task 1 – Verify Logging Support

The rsyslog service was checked to confirm that system logging functionality was available in the environment.

### Command

```bash
sudo systemctl status rsyslog
```

### Result

The rsyslog service was found running successfully, confirming Syslog support on the system.

---

## Task 2 – Configure Log Destination

A remote Syslog destination was configured to forward logs to the SIEM server.

### Configuration

The following line was added to the rsyslog configuration file:

```bash
*.* @<SIEM_SERVER_IP>:514
```

### Validation

Configuration syntax was verified using:

```bash
sudo rsyslogd -N1
```

The service was then restarted:

```bash
sudo systemctl restart rsyslog
```

### Result

The configuration was accepted successfully and the logging service restarted without errors.

---

## Task 3 – Generate and Verify Logs

Test log entries were generated using the logger utility.

### Commands

```bash
logger "SIEM Lab 10 Test Log"
logger "Firewall Event: Connection Allowed"
logger "Firewall Event: Connection Denied"
```

Traffic monitoring was performed using:

```bash
sudo tcpdump -i any udp port 514
```

### Result

Generated events were observed being forwarded through the Syslog service and were available for monitoring by the SIEM platform.

---

## Screenshots

### Screenshot 1

rsyslog service status verification.

### Screenshot 2

Syslog forwarding configuration.

### Screenshot 3

Verification of log transmission using tcpdump or SIEM dashboard.

---

## Key Concepts Learned

* Syslog is a standard protocol for centralized log collection.
* Routers and firewalls commonly forward logs to SIEM platforms using Syslog.
* Log forwarding enables security monitoring, threat detection, and incident investigation.
* Proper log configuration is essential for maintaining network visibility.

---

## Conclusion

In this lab, Syslog functionality was configured and tested within an Ubuntu environment to simulate firewall or router log forwarding. The rsyslog service was used to generate and transmit logs to a SIEM platform. Successful verification demonstrated how centralized logging supports security monitoring, troubleshooting, and incident response activities.
