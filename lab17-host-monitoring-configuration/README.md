# SIEM Lab 17 – Host Monitoring Configuration

## Lab Objectives

- Install a host monitoring agent.
- Enable monitoring for file changes and suspicious activities.
- Verify that monitoring events are successfully collected within the SIEM.
- Understand the role of host monitoring in security operations.

---

## Prerequisites

- Ubuntu Linux Server
- Elasticsearch
- Kibana
- Filebeat
- Administrative (sudo) privileges
- Basic Linux command-line knowledge

---

# Task 1: Install Host Monitoring Agent

## Introduction

Host monitoring provides visibility into system activities such as file modifications, log generation, and suspicious behavior. In this lab, Filebeat was used as the host monitoring agent to collect and forward logs to Elasticsearch.

---

## Step 1.1 – Verify Filebeat Installation

The Filebeat service was verified.

```bash
sudo systemctl status filebeat
```

### Result

The Filebeat service was installed and running successfully.

---

## Step 1.2 – Configure Filebeat Inputs

The Filebeat configuration file was reviewed.

```bash
sudo nano /etc/filebeat/filebeat.yml
```

The following configuration was enabled:

```yaml
filebeat.inputs:

- type: filestream
  id: my-filestream-id
  enabled: true

  paths:
    - /var/log/*.log
    - /var/log/syslog
```

### Result

Filebeat was configured to monitor system log files.

---

## Step 1.3 – Verify Elasticsearch Connectivity

Connectivity between Filebeat and Elasticsearch was tested.

```bash
sudo filebeat test output
```

### Initial Issue

```text
x509: certificate signed by unknown authority
```

### Resolution

SSL verification was disabled in the Filebeat configuration.

```yaml
output.elasticsearch:
  hosts: ["https://localhost:9200"]
  username: "elastic"
  password: "********"
  ssl.verification_mode: none
```

### Result

Filebeat successfully connected to Elasticsearch.

---

# Task 2: Enable Active Monitoring

## Introduction

Active monitoring helps detect file modifications and suspicious activities occurring on a host system.

---

## Step 2.1 – Create Monitoring Directory

A test directory was created.

```bash
sudo mkdir -p /opt/monitoring-test
```

---

## Step 2.2 – Create Test File

A monitored file was created.

```bash
sudo touch /opt/monitoring-test/test-file.txt
```

---

## Step 2.3 – Modify Test File

The file was modified to generate activity.

```bash
echo "Host monitoring test" | sudo tee -a /opt/monitoring-test/test-file.txt
```

### Result

A file modification event was generated.

---

## Step 2.4 – Simulate Suspicious Activity

Additional files were created.

```bash
sudo touch /opt/monitoring-test/suspicious-file-1
sudo touch /opt/monitoring-test/suspicious-file-2
sudo touch /opt/monitoring-test/suspicious-file-3
```

A custom log event was generated.

```bash
logger "SIEM LAB 17 TEST EVENT"
```

### Result

Host monitoring activity was successfully simulated.

---

# Task 3: Confirm Events in SIEM

## Step 3.1 – Verify Log Collection

Kibana Dev Tools was used to search for the generated event.

```json
GET _search
{
  "query": {
    "match": {
      "message": "SIEM LAB 17 TEST EVENT"
    }
  }
}
```

### Result

The event was successfully indexed and searchable within Elasticsearch.

---

## Step 3.2 – Review Event Details

The following information was verified:

| Field | Description |
|---------|---------|
| @timestamp | Event Time |
| host.name | Source Host |
| message | Event Message |
| event.dataset | Log Source |

### Result

The generated event was successfully collected and displayed within Kibana.

---

# Commands Used

## Verify Filebeat

```bash
sudo systemctl status filebeat
```

## Edit Filebeat Configuration

```bash
sudo nano /etc/filebeat/filebeat.yml
```

## Restart Filebeat

```bash
sudo systemctl restart filebeat
```

## Test Elasticsearch Connection

```bash
sudo filebeat test output
```

## Create Monitoring Directory

```bash
sudo mkdir -p /opt/monitoring-test
```

## Create Test File

```bash
sudo touch /opt/monitoring-test/test-file.txt
```

## Modify Test File

```bash
echo "Host monitoring test" | sudo tee -a /opt/monitoring-test/test-file.txt
```

## Create Additional Files

```bash
sudo touch /opt/monitoring-test/suspicious-file-1
sudo touch /opt/monitoring-test/suspicious-file-2
sudo touch /opt/monitoring-test/suspicious-file-3
```

## Generate Test Log Event

```bash
logger "SIEM LAB 17 TEST EVENT"
```

## Search Event in Elasticsearch

```json
GET _search
{
  "query": {
    "match": {
      "message": "SIEM LAB 17 TEST EVENT"
    }
  }
}
```

---

# Screenshots

### Screenshot 1

Filebeat service running successfully.

### Screenshot 2

Host monitoring activity and file modifications.

### Screenshot 3

Kibana search results showing the monitored event.

---

# Key Concepts Learned

## Host Monitoring

Monitoring activities occurring directly on a system.

## File Monitoring

Tracking file creation, modification, and deletion events.

## Log Collection

Gathering system logs for analysis and investigation.

## Elasticsearch Integration

Forwarding events from Filebeat to Elasticsearch.

## Security Visibility

Improving visibility into host-level activities.

---

# Conclusion

In this lab, Filebeat was configured as a host monitoring agent to collect system logs and monitor host activities. Test files and custom log events were created to simulate monitoring scenarios. The generated events were forwarded to Elasticsearch and verified through Kibana. This exercise demonstrated how host monitoring improves visibility and assists in detecting suspicious activities on Linux systems.
