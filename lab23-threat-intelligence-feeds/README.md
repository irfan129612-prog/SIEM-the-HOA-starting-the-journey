# SIEM Lab 23 – Threat Intelligence Feeds

## Lab Objectives

* Understand the concept of Threat Intelligence Feeds.
* Integrate threat intelligence data into Elasticsearch.
* Correlate threat indicators with security events.
* Detect malicious activity using threat intelligence.

---

## Introduction

Threat Intelligence Feeds provide continuously updated information about known malicious IP addresses, domains, URLs, malware indicators, and attack infrastructure. Integrating these feeds into a SIEM enables proactive threat detection and faster incident response.

---

# Task 1: Understanding Threat Intelligence Feeds

## What are Threat Intelligence Feeds?

Threat feeds contain:

* Malicious IP addresses
* Known malware hosts
* Phishing domains
* Command and Control (C2) infrastructure
* Threat indicators

### Benefits

* Early threat detection
* Improved situational awareness
* Better alert context
* Faster response to incidents

---

# Task 2: Selecting a Threat Intelligence Feed

A local JSON threat feed was created for testing purposes.

```json
[
  {"ip":"185.220.101.1","threat":"TOR Exit Node"},
  {"ip":"45.95.147.236","threat":"Known Malware Host"},
  {"ip":"192.168.1.200","threat":"Lab Test IP"}
]
```

### Result

A sample threat intelligence feed was prepared.

---

# Task 3: Configuring the SIEM System

## Create Threat Feed Index

```json
PUT threat-feed
```

## Insert Threat Intelligence Data

```json
POST threat-feed/_doc
{
  "ip":"185.220.101.1",
  "threat":"TOR Exit Node"
}
```

```json
POST threat-feed/_doc
{
  "ip":"45.95.147.236",
  "threat":"Known Malware Host"
}
```

```json
POST threat-feed/_doc
{
  "ip":"192.168.1.200",
  "threat":"Lab Test IP"
}
```

### Result

Threat intelligence indicators were successfully stored in Elasticsearch.

---

# Task 4: Correlating and Analyzing Data

## Create Test Security Event

```json
POST suspicious-login-logs/_doc
{
  "source.ip":"192.168.1.200",
  "event.action":"login_attempt",
  "message":"Login attempt from threat feed IP"
}
```

## Correlation Search

```json
GET suspicious-login-logs/_search
{
  "query": {
    "match": {
      "source.ip":"192.168.1.200"
    }
  }
}
```

### Result

The inbound event matched an indicator present in the threat feed.

---

# Task 5: Testing and Validation

## Search Threat Feed

```json
GET threat-feed/_search
{
  "query": {
    "match": {
      "ip":"192.168.1.200"
    }
  }
}
```

## Search Event Logs

```json
GET suspicious-login-logs/_search
{
  "query": {
    "match": {
      "source.ip":"192.168.1.200"
    }
  }
}
```

### Validation Results

* Threat feed successfully ingested.
* Malicious IP identified.
* Event correlation completed.
* Threat indicator matched inbound log activity.

---

# Screenshots

### Screenshot 1

Threat intelligence feed file containing malicious IP addresses.

### Screenshot 2

Threat intelligence indicators stored within Elasticsearch.

### Screenshot 3

Threat correlation results showing matched IP activity.

---

# Key Concepts Learned

## Threat Intelligence

Information about known threats and malicious infrastructure.

## Indicators of Compromise (IOCs)

Observable evidence of malicious activity such as IPs, domains, or hashes.

## Correlation

Matching security events against threat intelligence indicators.

## Threat Detection

Identifying suspicious activity using external intelligence sources.

## Proactive Defense

Using threat intelligence to detect attacks before significant damage occurs.

---

# Conclusion

In this lab, a threat intelligence feed was integrated into Elasticsearch and used to identify potentially malicious activity. Security events were correlated against threat indicators, demonstrating how threat intelligence enhances visibility, improves detection capabilities, and supports proactive cyber defense strategies.
