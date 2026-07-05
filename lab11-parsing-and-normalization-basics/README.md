# SIEM Lab 11 – Parsing & Normalization Basics

## Overview

Parsing and normalization are essential processes in Security Information and Event Management (SIEM) systems. Parsing converts raw log data into structured fields, while normalization standardizes data from different sources into a consistent format. These processes improve searchability, correlation, and analysis of security events.

In this lab, sample log data was reviewed, parser configuration was examined, and the parsing process was validated using open-source tools and JSON-based log files.

---

## Objectives

* Understand the fundamentals of parsing and normalization.
* Identify important fields within log data.
* Review parser configuration and field mappings.
* Verify successful parsing of structured log events.
* Understand the importance of normalized data in SIEM environments.

---

## Tools Used

* Ubuntu Linux
* Nano Editor
* JSON Log Files
* jq (JSON Processor)
* Command Line Interface (CLI)

---

## Task 1 – Reviewing Sample Logs

A sample JSON log file was created and reviewed to identify important fields commonly used in SIEM platforms.

### Sample Log

```json
{
  "timestamp": "2023-10-15T13:45:30Z",
  "source_ip": "192.168.1.1",
  "event_id": "abc123",
  "event_type": "UserLogin"
}
```

### Key Fields Identified

| Field      | Purpose                           |
| ---------- | --------------------------------- |
| timestamp  | Indicates when the event occurred |
| source_ip  | Identifies the originating system |
| event_id   | Unique identifier for the event   |
| event_type | Defines the type of activity      |

### Result

The log structure was successfully reviewed and important fields were identified.

---

## Task 2 – Reviewing Parser Configuration

A sample parser configuration was examined to understand how raw log fields are mapped and processed.

### Parser Configuration

```json
{
  "description": "Field Extraction for Log Data",
  "processors": [
    {
      "date": {
        "field": "timestamp",
        "formats": ["ISO8601"]
      }
    },
    {
      "rename": {
        "field": "ip_addr",
        "target_field": "source_ip"
      }
    }
  ]
}
```

### Result

The configuration demonstrated:

* Timestamp conversion using ISO8601 format.
* Field renaming for normalization.
* Structured field extraction for analysis.

---

## Task 3 – Verifying the Parsing Process

The sample log was validated using command-line tools.

### Validation Commands

```bash
grep timestamp sample-log.json
grep source_ip sample-log.json
grep event_id sample-log.json
jq . sample-log.json
```

### Verification

The parser successfully recognized:

* Timestamp field
* Source IP field
* Event ID field
* Event Type field

The JSON structure was validated without errors.

### Result

The parsing process successfully transformed raw log data into structured, searchable fields.

---

## Screenshots

### Screenshot 1

Sample JSON log containing timestamp, source IP, event ID, and event type.

### Screenshot 2

Parser configuration showing field extraction and normalization rules.

### Screenshot 3

JSON validation and parsing verification using jq.

---

## Key Concepts Learned

### Parsing

The process of extracting meaningful fields from raw log data.

### Normalization

The process of converting data from different sources into a consistent format.

### Structured Data

Data stored in predefined fields that can be easily searched and analyzed.

### Unstructured Data

Raw text logs that require parsing before analysis.

### Field Mapping

The process of assigning source fields to standardized destination fields.

---

## Conclusion

This lab provided a practical introduction to parsing and normalization concepts used in SIEM environments. Sample log data was reviewed, parser configuration was analyzed, and field extraction was verified successfully. Proper parsing and normalization ensure accurate event analysis, efficient searching, and reliable security monitoring across multiple log sources.
