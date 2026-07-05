# SIEM Lab 26 – Creating an HOA-Focused Use Case

## Lab Objectives

* Integrate HOA-related event sources into ELK Stack.
* Create custom detection rules for unusual activities.
* Generate alerts based on HOA security events.
* Validate security monitoring through simulated gate access logs.

---

## Introduction

Homeowners Associations (HOAs) often rely on physical security systems such as access gates, surveillance cameras, and visitor management systems. Monitoring these systems through a SIEM platform improves visibility and enables rapid detection of unusual activities.

This lab demonstrates how ELK Stack can be used to monitor HOA gate access events and generate alerts for suspicious after-hours activity.

---

# Task 1: Verify ELK Stack

The following services were verified:

```bash
sudo systemctl status elasticsearch

sudo systemctl status logstash

sudo systemctl status kibana
```

Elasticsearch connectivity was validated:

```bash
curl -k -u elastic:PASSWORD https://localhost:9200
```

### Result

ELK Stack services were operational.

---

# Task 2: Create HOA Event Source

A gate access log file was created.

```text
2023-09-15T00:45:00 Security Gate1 User123 Entry
2023-09-15T01:00:00 Security Gate2 User456 Exit
2023-09-15T02:30:00 Security Gate3 User789 Entry
```

### Result

Sample HOA security events were generated.

---

# Task 3: Configure Logstash Rule

A Logstash pipeline was created to ingest HOA gate access logs.

```ruby
input {
  file {
    path => "/home/ubuntu/hoa-lab/gate_logs.log"
    start_position => "beginning"
    sincedb_path => "/dev/null"
  }
}

filter {

  grok {
    match => {
      "message" => "%{TIMESTAMP_ISO8601:event_time} %{WORD:department} %{WORD:gate} %{WORD:user} %{WORD:action}"
    }
  }

  mutate {
    add_tag => ["unusual_activity"]
  }
}

output {
  elasticsearch {
    hosts => ["https://localhost:9200"]
    index => "hoa-security"
    ssl_verification_mode => "none"
  }
}
```

### Result

HOA logs were parsed and indexed.

---

# Task 4: Verify Data in Elasticsearch

Verify index:

```json
GET _cat/indices?v
```

Search events:

```json
GET hoa-security/_search
```

### Result

HOA security events appeared within Elasticsearch and Kibana.

---

# Task 5: Create HOA Security Alert

A Kibana alert rule was created.

### Rule Name

```text
HOA After Hours Access Alert
```

### Query

```kql
tags : "unusual_activity"
```

### Result

The SIEM generated alerts when matching events were detected.

---

# Task 6: Test Alert Functionality

A new gate access event was added.

```bash
echo "2023-09-16T01:30:00 Security Gate1 User999 Entry" >> ~/hoa-lab/gate_logs.log
```

Logstash processed the event and generated a matching alert.

### Result

Alert generation was successfully validated.

---

# Screenshots

### Screenshot 1

ELK Stack service verification.

### Screenshot 2

HOA security events displayed in Kibana.

### Screenshot 3

HOA after-hours access alert triggered.

---

# Key Concepts Learned

## HOA Security Monitoring

Monitoring gate access and physical security events.

## Log Parsing

Extracting structured fields from unstructured logs.

## Event Correlation

Identifying unusual access patterns.

## Alerting

Generating notifications based on custom rules.

## SIEM Visibility

Centralized monitoring of HOA security activities.

---

# Conclusion

In this lab, ELK Stack was used to ingest and analyze HOA gate access logs. Custom Logstash parsing rules were developed, unusual activities were tagged, and Kibana alerts were configured to detect after-hours access attempts. This use case demonstrates how SIEM technologies can improve physical security monitoring within HOA environments.
