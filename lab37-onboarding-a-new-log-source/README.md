# SIEM Lab 37 – Onboarding a New Log Source

## Overview

Onboarding a new log source is an important SIEM activity that improves visibility across systems and applications. This process involves selecting a data source, configuring a collector or agent, validating log transmission, and ensuring logs are properly parsed for analysis.

In this lab, a cloud application log source was simulated and integrated into a SIEM workflow.

---

## Lab Objectives

* Understand the onboarding process for a new log source.
* Configure a collector or agent.
* Validate log collection.
* Parse incoming logs.
* Verify visibility in the SIEM workflow.

---

## Tools Used

| Tool                    | Purpose        |
| ----------------------- | -------------- |
| Linux CLI               | Administration |
| Wazuh Agent (Simulated) | Log Collection |
| JSON Logs               | Log Source     |
| grep                    | Log Parsing    |

---

# Task 1 – Select a New Source

## Selected Source

A simulated AWS CloudWatch log source was chosen as the new data source.

### Example Events

```json
{"source":"AWS CloudWatch","event":"Login Success","user":"admin","timestamp":"2026-06-19T10:00:00Z"}

{"source":"AWS CloudWatch","event":"Failed Login","user":"test","timestamp":"2026-06-19T10:05:00Z"}
```

### Result

A cloud-based log source was selected for onboarding.

---

# Task 2 – Install and Configure Collector

## Agent Selection

The Wazuh Agent was selected as the log collector.

### Installation Command

```bash
sudo apt-get update

sudo apt-get install wazuh-agent
```

### Configuration

The agent configuration file would normally be located at:

```text
/var/ossec/etc/ossec.conf
```

Configuration parameters include:

* SIEM Server IP
* Log Source Details
* Agent Identification

### Result

Collector configuration process completed.

---

# Task 3 – Validate and Parse Logs

## Verify Incoming Logs

```bash
cat cloud_app.log
```

### Output

```json
{"source":"AWS CloudWatch","event":"Login Success","user":"admin","timestamp":"2026-06-19T10:00:00Z"}

{"source":"AWS CloudWatch","event":"Failed Login","user":"test","timestamp":"2026-06-19T10:05:00Z"}
```

---

## Parse Event Fields

```bash
grep "event" cloud_app.log
```

### Extract Failed Login Events

```bash
grep "Failed Login" cloud_app.log
```

### Result

Relevant security events were successfully identified.

---

# Validation

## Validation Steps

* Log source selected.
* Agent installation simulated.
* Logs received successfully.
* Events parsed successfully.
* Security-relevant activity identified.

### Validation Report

```text
Log Source Successfully Onboarded
```

---

# Key Concepts Learned

## Log Source

A system or application generating security-relevant logs.

## Collector / Agent

Software responsible for gathering and forwarding logs.

## Log Parsing

Converting raw logs into structured fields for analysis.

## SIEM Integration

Connecting external systems to centralized monitoring platforms.

## Security Visibility

Improving detection and monitoring through additional data sources.

---

# Lab Outcome

A cloud application log source was successfully onboarded into a simulated SIEM environment. Log collection, validation, and parsing processes were completed to demonstrate how organizations integrate new security telemetry sources.

---

# Conclusion

This lab demonstrated the onboarding process for a new log source into a SIEM environment. By selecting a source, configuring a collector, validating log transmission, and parsing security events, analysts can improve visibility and strengthen security monitoring capabilities.
