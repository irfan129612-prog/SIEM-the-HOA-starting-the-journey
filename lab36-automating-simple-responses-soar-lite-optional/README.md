# SIEM Lab 36 – Automating Simple Responses (SOAR Lite)

## Overview

Security Orchestration, Automation, and Response (SOAR) solutions help security teams automate repetitive response actions and improve incident response speed.

In this lab, a lightweight SOAR workflow was simulated by automatically blocking a suspicious IP address after detecting a security alert. The automation was implemented using a simple Bash script and Linux firewall rules.

---

## Lab Objectives

* Understand SOAR fundamentals.
* Configure an automated response to a security alert.
* Simulate a security event.
* Execute an automated blocking action.
* Verify response effectiveness.

---

## Tools Used

| Tool        | Purpose             |
| ----------- | ------------------- |
| Linux CLI   | Administration      |
| Bash Script | Automation          |
| iptables    | Firewall Management |
| Log Files   | Alert Simulation    |

---

# Task 1 – Configure Automated Response

## Alert Scenario

A port scanning attempt was detected from a suspicious IP address.

### Simulated Attacker IP

```text
192.168.1.100
```

---

## Create Automated Response Script

### Script

```bash
#!/bin/bash

IP_ADDRESS=$1

sudo iptables -A INPUT -s $IP_ADDRESS -j DROP

echo "Blocked IP: $IP_ADDRESS"
```

### Save Script

```bash
nano auto_block.sh
```

### Make Executable

```bash
chmod +x auto_block.sh
```

### Result

Automated response script successfully created.

---

# Task 2 – Simulate Security Alert

## Create Alert Log

```bash
echo "Port Scan Detected From 192.168.1.100" > alert.log
```

### Verify Alert

```bash
cat alert.log
```

### Output

```text
Port Scan Detected From 192.168.1.100
```

### Result

Security alert successfully simulated.

---

# Task 3 – Execute Automated Response

## Run Script

```bash
sudo ./auto_block.sh 192.168.1.100
```

### Expected Output

```text
Blocked IP: 192.168.1.100
```

### Result

Firewall rule added automatically.

---

# Task 4 – Verify Response Action

## Check Firewall Rules

```bash
sudo iptables -L
```

### Example Output

```text
DROP       all  --  192.168.1.100   anywhere
```

### Validation

* Alert generated.
* Automated script executed.
* Firewall rule added.
* Suspicious IP blocked.

---

# SOAR Workflow

```text
Port Scan Detected
        ↓
Security Alert Generated
        ↓
Automated Script Triggered
        ↓
Firewall Rule Added
        ↓
Attacker IP Blocked
```

---

# Key Concepts Learned

## SOAR

Security Orchestration, Automation, and Response.

## Automated Response

Automatically executing security actions without manual intervention.

## Alert-Driven Actions

Triggering response activities when security events occur.

## Firewall Automation

Automatically updating firewall rules to block malicious traffic.

## Response Efficiency

Reducing response time and manual effort.

---

# Lab Outcome

A lightweight SOAR workflow was successfully simulated. A security alert triggered an automated response script that blocked a suspicious IP address using Linux firewall rules.

---

# Conclusion

This lab demonstrated how simple automation can improve security operations. By automatically responding to security alerts and blocking malicious IP addresses, organizations can reduce incident response time and improve operational efficiency without requiring a full SOAR platform.
