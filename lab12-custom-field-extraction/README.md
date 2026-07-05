# SIEM Lab 12 – Custom Field Extraction

## Overview

Custom field extraction is a critical process in Security Information and Event Management (SIEM) systems. When logs contain data that is not automatically recognized by default parsers, custom extraction techniques such as Regular Expressions (Regex) and Grok patterns are used to identify and structure important information.

This lab demonstrates how to identify logs with missing fields, extract data using Regex, parse logs using Grok patterns, and validate the extracted fields within an Elastic Stack (ELK) environment.

---

## Objectives

* Understand custom field extraction concepts.
* Learn how Regex patterns identify specific data.
* Learn how Grok patterns simplify log parsing.
* Validate extracted fields in Kibana.
* Improve log visibility and searchability.

---

## Tools Used

* Elasticsearch
* Kibana
* Grok Processor
* Regex Queries
* Ubuntu Linux

---

## Task 1 – Identify Logs with Missing Fields

A sample Syslog event was added to Elasticsearch for analysis.

### Sample Log

```text
Jul 15 10:45:30 server1 sshd[1234]: Failed password for root from 192.168.1.100 port 22 ssh2
```

### Purpose

The log contains useful information such as:

* Timestamp
* Hostname
* Program Name
* Process ID
* Source IP Address
* Event Message

However, these values are embedded inside a single message field and require custom extraction.

### Result

The raw log was successfully indexed and prepared for parsing.

---

## Task 2 – Extract Fields Using Regex

A Regular Expression was used to identify IPv4 addresses.

### Regex Pattern

```regex
(\d{1,3}\.){3}\d{1,3}
```

### Kibana Query

```json
GET custom-logs/_search
{
  "query": {
    "regexp": {
      "message": {
        "value": ".*192\\.168.*"
      }
    }
  }
}
```

### Result

The query successfully identified log entries containing the target IP address.

---

## Task 3 – Use Grok for Field Extraction

A Grok processor was configured to parse the Syslog message.

### Grok Pattern

```grok
%{SYSLOGTIMESTAMP:logdate} %{HOSTNAME:host} %{DATA:program}\[%{POSINT:pid}\]: %{GREEDYDATA:logmessage}
```

### Grok Simulation

```json
POST _ingest/pipeline/_simulate
{
  "pipeline": {
    "processors": [
      {
        "grok": {
          "field": "message",
          "patterns": [
            "%{SYSLOGTIMESTAMP:logdate} %{HOSTNAME:host} %{DATA:program}\\[%{POSINT:pid}\\]: %{GREEDYDATA:logmessage}"
          ]
        }
      }
    ]
  },
  "docs": [
    {
      "_source": {
        "message": "Jul 15 10:45:30 server1 sshd[1234]: Failed password for root from 192.168.1.100 port 22 ssh2"
      }
    }
  ]
}
```

### Extracted Fields

| Field      | Value                                                    |
| ---------- | -------------------------------------------------------- |
| logdate    | Jul 15 10:45:30                                          |
| host       | server1                                                  |
| program    | sshd                                                     |
| pid        | 1234                                                     |
| logmessage | Failed password for root from 192.168.1.100 port 22 ssh2 |

### Result

The Grok processor successfully converted the raw log into structured fields.

---

## Task 4 – Validate Extracted Fields

The parsed output was reviewed in Kibana.

### Validation Checks

* Timestamp extracted correctly.
* Hostname parsed successfully.
* Program name identified.
* Process ID captured.
* Event message preserved.
* Source information retained.

### Result

All custom fields were extracted accurately and were available for searching and analysis.

---

## Screenshots

### Screenshot 1

Creating and indexing the sample log document in Kibana Dev Tools.

### Screenshot 2

Regex query identifying matching log entries.

### Screenshot 3

Grok simulation displaying extracted custom fields.

---

## Key Concepts Learned

### Regular Expression (Regex)

Regex is used to identify patterns within log data and extract specific values.

### Grok

Grok provides predefined parsing patterns that simplify complex regular expressions.

### Field Extraction

The process of converting raw log messages into searchable structured data.

### Log Normalization

Standardizing fields so that logs from different sources can be analyzed consistently.

---

## Conclusion

In this lab, custom field extraction was performed using both Regex and Grok patterns. Raw Syslog data was successfully parsed into structured fields, making the information searchable and easier to analyze within Kibana. Custom field extraction is an essential skill for SOC analysts, SIEM engineers, and security monitoring teams because it improves visibility, correlation, and threat detection capabilities.
